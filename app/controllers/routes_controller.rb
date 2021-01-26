class RoutesController < ApplicationController
  before_action :set_action, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :search]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @routes = Route.includes(:user).order("created_at DESC")
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @route = Route.find(params[:id])
    @comment = Comment.new
    @comments = @route.comments.includes(:user)
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])
    if @route.update(route_params)
      redirect_to route_path(@route)
    else
      render :edit
    end
  end

  def destroy
    @route = Route.find(params[:id])
    if @route.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    @routes = Route.search(params[:keyword])
  end


  private

  def set_action
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title, :text, :city_id, :category_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id != @route.user_id
      redirect_to root_path
    end
  end

end