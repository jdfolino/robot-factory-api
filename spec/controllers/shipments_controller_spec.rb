require 'rails_helper'

RSpec.describe ShipmentsController do
  describe 'PUT update' do
    before do
      @robot = FactoryBot.create(:robot)
      @robot2 = FactoryBot.create(:robot)
    end

    it 'calls the ShipmentService' do
      expect_any_instance_of(ShipmentService).to receive(:process)
      put :update, params: { ids: [@robot.id, @robot2.id] }
    end

    it 'returns success' do
      put :update, params: { ids: [@robot.id, @robot2.id] }
      expect(response).to have_http_status(200)
    end
  end
end
