require 'rails_helper'

RSpec.describe Robots::ApprovalsController do
  describe 'POST update' do
    before do
      @robot = FactoryBot.create(:robot)
      post :create, params: { robot_id: @robot.id }
    end

    it 'changes the stage to `recycled`' do
      expect(@robot.reload.stage).to eq('passed_qa')
    end

    it 'returns success' do
      expect(response).to have_http_status(200)
    end

    it 'assigns the robot' do
      expect(assigns[:robot]).to eq(@robot)
    end
  end
end
