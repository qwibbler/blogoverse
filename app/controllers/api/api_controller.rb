module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    def find_user_by_token(token)
      User.where(token: token)[0]
    end

    def authenticate_user(user)
      unless user
        render json: { success: false, errors: 'Invalid Token' }, status: 400
      end
      true
    end

    def find_user_and_authenticate(token)
      user = find_user_by_token(token)
      authenticate_user(user)
    end
  end
end