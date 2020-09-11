class User < ApplicationRecord
  has_many :applications

  validates_presence_of :name
end
