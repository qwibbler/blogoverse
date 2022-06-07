class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: params[:user_id])
  end
end
