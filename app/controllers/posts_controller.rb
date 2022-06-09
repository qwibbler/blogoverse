class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: params[:user_id]).order('created_at DESC')
    @posts.each do |post|
      post.update_likes_count
      post.update_comments_count
    end
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @new_post = @user.posts.new(params.require(:post).permit(:title, :text))
    respond_to do |format|
      format.html do
        if @new_post.save
          flash[:success] = t('post_success')
          redirect_to [@user, @new_post]
        else
          flash.now[:error] = t('post_error')
          render :new
        end
      end
    end
    @new_post
  end

  def show
    @post = Post.find(params[:id])
    @post.update_likes_count
    @post.update_comments_count
    @comments = Comment.where(post_id: params[:id])
  end
end
