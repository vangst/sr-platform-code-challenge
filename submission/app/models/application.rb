class Application < ApplicationRecord
  enum status: [ :pending_review, :approved, :rejected ]
  belongs_to :user
  belongs_to :position

  validates_presence_of :resume

  def approve
    update(status: 'approved')
  end

  def reject
    update(status: 'rejected')
  end
end
