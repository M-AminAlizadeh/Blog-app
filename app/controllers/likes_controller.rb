class LikesController < ApplicationController
  layout 'general'
  
  def create
    @like = Like.new(post_id: params[:post_id], user_id: params[:user_id])
    @like.user = current_user
    if @like.save
      flash[:success] = 'Liked'
      redirect_to user_post_path(id: @like.post_id, user_id: @like.user_id)
    else
      flash.now[:error] = 'Error'
    end
  end
end
