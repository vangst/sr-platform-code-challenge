class ApplicationEngine
  attr_accessor :error_message

  def initialize(position_id, user_id)
    @position = Position.includes(:applications).find(position_id)
    @user = User.find(user_id)
    @error_message = nil
  end

  # Note: this method returns true/false because I imagine it being used
  # in a controller endpoint, and those return values make for some clear
  # if/else logic in the controller
  def submit_application(application_params)
    return no_longer_open if @position.closed?
    begin
      create_application(application_params)
    rescue => error
      @error_message = error.message
      false
    end
  end

  # Note: these next two methods don't do much now, but in a more
  # complicated app they could deal with the implications of approving/rejecting
  # a user's application
  def approve_application(application_id)
    application = Application.find(application_id)
    application.approve
  end

  def reject_application(application_id)
    application = Application.find(application_id)
    application.reject
  end

  private

  def create_application(application_params)
    app = Application.new(application_params)
    app.user = @user
    app.position = @position
    app.save!
  end

  def no_longer_open
    # Note: to track applications that were submitted late, we could add another Application status for that ('submitted late'),
    # to allow keeping that application data in the db
    @error_message = 'This position is no longer open.'
    false
  end
end
