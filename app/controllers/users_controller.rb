class UsersController < ApplicationController
  def index
    @users = User.order('updated_at DESC').all
    @users.each(&:update_posts_count)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
    @user.update_posts_count
  end
end
