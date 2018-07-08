class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id
    if user_signed_in?
      if @comment.save
      redirect_to video_path(@commentable), notice: 'Your comment was successfully posted!'
      else
      redirect_to video_path(@commentable), notice: "Your comment wasn't posted!"
      end
    else
      redirect_to new_user_session_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Video.find_by_id(params[:video_id]) if params[:video_id]
  end

end
