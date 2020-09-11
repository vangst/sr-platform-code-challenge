require 'rails_helper'

RSpec.describe Position, type: :model do
  # NOTE: would normally be using FactoryBot or something similar
  let(:company) { Company.create(name: 'test company') }
  let(:user_1) { User.create(name: 'Steve') }
  let(:position) { Position.create(company_id: company.id, description: 'A great job', application_limit: 1) }

  describe 'relationships' do
    it { should have_many(:applications) }
    it { should belong_to(:company) }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
  end

  describe '#closed' do
    it 'returns false if the number of applications are below the application limit' do
      expect(position.closed?).to be(false)
    end

    it 'returns triue if the number of applications reaches the application limit' do
      application = Application.create(position_id: position.id, user_id: user_1.id, resume: 'text')
      expect(position.reload.closed?).to be(true)
    end
  end
end
