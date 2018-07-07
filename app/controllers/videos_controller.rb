class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :liked, :unliked]

  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = Video.new
  end

  def liked
    if user_signed_in?
      @video.liked_by current_user
      redirect_to videos_path
    else
      redirect_to new_user_session_path
    end
  end

  def unliked
    if user_signed_in?
      @video.unliked_by current_user
      redirect_to videos_path
    else
      redirect_to new_user_session_path
    end
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.fetch(:video, {})
    end
end
