class UsersController < ApplicationController
  # has_many :users

  def show
    puts params[:id]
  end
end
