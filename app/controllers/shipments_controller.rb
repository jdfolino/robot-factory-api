class ShipmentsController < ApplicationController
  def update
    ShipmentService.new(params[:ids].split(',')).process
    render status: :ok
  end
end
