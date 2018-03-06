require 'rails_helper'

RSpec.describe Robots::RecycleController do
  describe 'POST update' do
    before do
      @robot = FactoryBot.create(:robot)
      @robot2 = FactoryBot.create(:robot)
      post :create, params: { ids: [@robot.id, @robot2.id] }
    end

    it 'changes the stage to `recycled`' do
      expect(@robot.reload.stage).to eq('recycled')
      expect(@robot2.reload.stage).to eq('recycled')
    end

    it 'returns success' do
      expect(response).to have_http_status(200)
    end
  end
end
