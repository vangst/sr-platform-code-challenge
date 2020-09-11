require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'relationships' do
    it { should have_many(:positions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
