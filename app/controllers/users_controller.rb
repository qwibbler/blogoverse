class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end

  def index
    @users = User.all
  end
end
