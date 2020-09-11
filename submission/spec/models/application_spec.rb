require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:position) }
  end

  describe 'validations' do
    it { should validate_presence_of(:resume) }
  end

  describe 'status' do
    it { should define_enum_for(:status).with_values([:pending_review, :approved, :rejected]) }
  end
end
