module Api
  class PostsController < ApiController
    def index
      if get_user_by_token(params[:token]).nil?
        render json: { success: false, errors: 'Invalid Token' }, status: 400
      else
        @posts = Post.all.order(created_at: :desc)
        render json: @posts, status: 200
      end
    end
  end
end
