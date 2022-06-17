require 'swagger_helper'

RSpec.describe 'API Posts', type: :request do
  path '/api/posts' do
    get 'Retrieves all posts' do
      tags 'Posts'
      consumes 'multipart/form-data'
      parameter name: :token, in: :formData, type: :string, required: true

      response '200', 'OK' do
        schema type: :array,
               items: {
                 id: { type: :integer },
                 user_id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string },
                 comments_counter: { type: :integer },
                 likes_counter: { type: :integer },
                 created_at: { type: :datetime },
                 updated_at: { type: :datetime }
               }, required: %w[id user_id title text comments_counter likes_counter created_at updated_at]
        #  }

        before do |_example|
          user = User.create(name: 'Maria', email: 'maria@example.com', password: 'password', confirmed_at: Time.now)
          Post.create(user:, title: 'title-first', text: 'test')
        end

        let(:token) do
          User.create(name: 'Jason', email: 'jason@example.com', password: 'password', confirmed_at: Time.now).token
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
