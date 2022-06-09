class UsersController < ApplicationController
  def index
    @users = User.order('updated_at DESC').all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end
end
