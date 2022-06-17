require 'swagger_helper'

RSpec.describe 'Blog API', type: :request do
  path '/api/posts' do
    get 'Retrieves all posts' do
      tags 'Posts'
      consumes 'multipart/form-data'
      parameter name: :token, in: :formData, type: :string, required: true

      response '200', 'OK' do
        schema type: :array,
               items: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string },
                 comments_counter: { type: :integer },
                 likes_counter: { type: :integer },
                 created_at: { type: :datetime },
                 updated_at: { type: :datetime }
               },
               required: %w[id user_id title text comments_counter likes_counter created_at updated_at]
        let(:token) do
          User.create(name: 'Empty', email: 'empty@example.com', password: 'password', confirmed_at: Time.now).token
        end
        run_test!
      end

      response '400', 'Invalid Token' do
        let(:token) { '0' }
        run_test!
      end
    end
  end
end
