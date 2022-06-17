module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    def get_user_by_token(token)
      return User.where(token:)[0] if token
    end
  end
end
