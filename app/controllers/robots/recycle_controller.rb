module Robots
  class RecycleController < ApplicationController
    def create
      ids = params[:ids].respond_to?(:each) ? params[:ids] : [params[:ids]]
      if ids
        ids.each { |id| Robot.find(id).recycle! }
        render status: :ok
      else
        render status: :unprocessable_entity
      end
    end
  end
end
