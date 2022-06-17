module Api
  class CommentsController < ApiController    
    def index
      find_user_and_authenticate(params[:token])
      @post = Post.find(params[:post_id])
      render json: @post.comments
    end

    def create
      user = find_user_by_token(params[:token])
      authenticate_user(user)
      @post = Post.find(params[:post_id])
      @comment = Comment.create(user: user, post: @post, text: params[:text])
      
      if @comment.id
        puts "Comment created"
        render json: { success: true, data: { comment: @comment } }, status: :created
      else
        puts "Comment failed"
        render json: { success: false, errors: @comment.errors }, status: 400
      end
    end

    def comment_params
      params.permit(:text)
    end
  end
end