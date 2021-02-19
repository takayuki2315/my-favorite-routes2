class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to route_path(@comment.route)
    else
      @route = @comment.route
      @comments = @route.comments
      render "routes/show"
    end
  end

  
  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, route_id: params[:route_id])
  end
end

