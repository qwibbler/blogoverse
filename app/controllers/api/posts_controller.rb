module Api
  class PostsController < ApiController
    def index
      @posts = Post.all.order(created_at: :desc)
      render json: @posts
    end
  end
end