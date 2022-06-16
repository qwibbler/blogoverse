class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.post = @post
    @like.user = current_user
    if @like.save
      redirect_to [@post.user, @post]
    else
      redirect_back fallback_location: root_path, notice: t('like_error')
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to user_post_path(@like.post.user, @like.post), notice: t('like_deleted')
  end
end
