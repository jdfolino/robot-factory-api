require 'rails_helper'

RSpec.describe Robots::ExtinguishesController do
  describe 'POST update' do
    context 'happy days' do
      before do
        @robot = FactoryBot.create(:robot, statuses: [Status.create(description: 'on_fire')])
        post :create, params: { robot_id: @robot.id }
      end

      it 'assigns a robot with the id given' do
        expect(assigns(:robot).id).to eq(@robot.id)
      end

      it 'returns success' do
        expect(response).to have_http_status(200)
      end
    end

    context 'invalid state' do
      before do
        @robot = FactoryBot.create(:robot)
        post :create, params: { robot_id: @robot.id }
      end

      it 'returns invalid entity' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
