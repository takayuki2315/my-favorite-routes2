class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @routes = @user.routes
  end
end