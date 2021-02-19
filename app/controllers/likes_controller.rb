class LikesController < ApplicationController
  before_action :route_params

  def create
    Like.create(user_id: current_user.id, route_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, route_id: params[:id]).destroy
  end

  private

  def route_params
    @route = Route.find(params[:id])
  end
end
