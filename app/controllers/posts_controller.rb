class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: params[:user_id]).order('created_at DESC')
    @posts.each do |post|
      post.update_likes_count
      post.update_comments_count
    end
  end

  def show
    @post = Post.find(params[:id])
    @post.update_likes_count
    @post.update_comments_count
    @comments = Comment.where(post_id: params[:id])
  end
end
