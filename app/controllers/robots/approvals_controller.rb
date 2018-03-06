module Robots
  class ApprovalsController < ApplicationController
    def create
      @robot = Robot.find(params[:robot_id])
      @robot.approve!
      render json: @robot, status: :ok
    end
  end
end
