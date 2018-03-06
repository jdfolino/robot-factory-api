module Robots
  class ExtinguishesController < ApplicationController
    def create
      @robot = Robot.find(params[:robot_id])
      if @robot.extinguish!
        render json: @robot
      else
        render json: @robot, status: :unprocessable_entity
      end
    end
  end
end
