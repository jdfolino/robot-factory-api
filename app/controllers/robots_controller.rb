class RobotsController < ApplicationController
  def index
    @robots = Robot.send(params[:stage] || :all).includes(:configuration, :statuses)
    render json: @robots
  end

  def update
    @robot = Robot.find(params[:id])
    render json: @robot.update!(robot_params)
  end

  private

  def robot_params
    params.permit(:stage)
  end
end
