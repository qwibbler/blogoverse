class UsersController < ApplicationController
  def index
    @users = User.order(updated_at: :desc).all
    render :json => @users
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
    render :json => @user
  end
end
