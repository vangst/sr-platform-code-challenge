class Company < ApplicationRecord
  has_many :positions
  
  validates_presence_of :name
end
