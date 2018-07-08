class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Your comment was successfully posted!"
      redirect_to video_path(@comment.video_id)
    else
      flash[:danger] = "Your comment wasn't posted!"
      redirect_to video_path(@comment.video_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :video_id)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Video.find_by_id(params[:video_id]) if params[:video_id]
  end

end
