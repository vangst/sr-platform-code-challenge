class Position < ApplicationRecord
  has_many :applications
  belongs_to :company

  validates_presence_of :description

  # NOTE: could also scope this by application status, ie not counting
  # already-rejected applications
  def closed?
    application_limit.present? && applications.count >= application_limit
  end
end
