class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.post = @post
    @comment.user = @current_user
    if @comment.save
      redirect_to [@post.user, @post], notice: t('comment_success')
      @comment.update_comments_count
    else
      redirect_back fallback_location: root_path, notice: t('comment_error')
    end
  end
end
