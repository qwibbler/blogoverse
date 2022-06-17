module Api
  class CommentsController < ApiController
    def index
      if get_user_by_token(params[:token]).nil?
        render json: { success: false, errors: 'Invalid Token' }, status: 400
      else
        @post = Post.find(params[:post_id])
        render json: @post.comments, status: 200
      end
    end

    def create
      user = get_user_by_token(params[:token])
      @post = Post.find(params[:post_id])

      if user.nil?
        render json: { success: false, errors: 'Invalid Token' }, status: 400
        return
      elsif params[:text].nil?
        render json: { success: false, errors: 'Comment must have text' }, status: 400
        return
      end

      @comment = Comment.create(user:, post: @post, text: params[:text])

      if @comment.id
        render json: { success: true, data: { comment: @comment } }, status: :created
      else
        render json: { success: false, errors: @comment.errors }, status: 400
      end
    end
  end
end
