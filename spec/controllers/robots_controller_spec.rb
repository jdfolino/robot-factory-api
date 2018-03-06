require 'rails_helper'

RSpec.describe RobotsController do
  describe 'GET index' do
    before do
      3.times { FactoryBot.create(:robot) }
      get :index
    end

    it 'assigns @robots' do
      expect(assigns(:robots).size).to eq(3)
    end

    it 'returns success' do
      expect(response).to have_http_status(200)
    end
  end
end
