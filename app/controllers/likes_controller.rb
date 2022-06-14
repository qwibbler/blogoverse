class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.post = @post
    @like.user = current_user
    if @like.save
      @like.update_likes_count
      redirect_to [@post.user, @post]
    else
      redirect_back fallback_location: root_path, notice: t('like_error')
    end
  end
end
