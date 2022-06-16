module Api
  class CommentsController < ApiController
    def index
      @post = Post.find(params[:post_id])
      render json: @post.comments
    end

    def create
      @post = Post.find(params[:post_id])
      @comment = Comment.new(comment_params.merge(author_id: current_user.id, post_id: @post.id))

      if @comment.save
        # render json: { success: true, data: { comment: @comment } }, status: :created
      else
        # render json: { success: false, errors: @comment.errors }, status: 400
      end
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end