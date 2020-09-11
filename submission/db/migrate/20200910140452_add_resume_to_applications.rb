class AddResumeToApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :applications, :resume, :string
  end
end
