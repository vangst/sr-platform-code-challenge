require 'rails_helper'

describe ApplicationEngine do
  subject { described_class }
  let(:company) { Company.create(name: 'test company') }
  let(:user_1) { User.create(name: 'Steve') }
  let(:position) { Position.create(company_id: company.id, description: 'A great job', application_limit: 1) }

  describe '#submit_application' do
    let(:app_engine) { subject.new(position.id, user_1.id) }
    let(:application_params) {
      { resume: 'great employee' }
    }
    it 'should create the application and close the position' do
      expect { app_engine.submit_application(application_params) }
        .to change { Application.count }.by(1)

      expect(position.applications.count).to eq(1)
      expect(position.closed?).to eq(true)
    end

    it 'should return an error if the position is closed' do
      app_engine.submit_application(application_params)
      expect { app_engine.submit_application(application_params) }
        .to change { Application.count }.by(0)

      expect(app_engine.error_message).to eq('This position is no longer open.')
    end
  end

  describe '#approve_application' do
  end

  describe '#reject_application' do
  end
end
