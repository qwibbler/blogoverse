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

  path '/api/posts/{id}/comments' do
    get 'Retrieves all posts' do
      tags 'Comments'
      consumes 'multipart/form-data'
      parameter name: :id, in: :path, type: :string, required: true
      parameter name: :token, in: :formData, type: :string, required: true

      response '200', 'OK' do
        schema type: :array,
               items: {
                 id: { type: :integer },
                 user_id: { type: :integer },
                 post_id: { type: :integer },
                 text: { type: :string },
                 created_at: { type: :datetime },
                 updated_at: { type: :datetime }
               },
               required: %w[id user_id post_id text created_at updated_at]
        let(:token) do
          User.create(name: 'Empty', email: 'empty@example.com', password: 'password', confirmed_at: Time.now).token
        end

        let(:id) do
          user = User.create(name: 'Maria', email: 'maria@example.com', password: 'password', confirmed_at: Time.now)
          Post.create(user: user, title: 'title-first', text: 'test').id
        end
        run_test!
      end

      response '400', 'Invalid Token' do
        let(:token) { '0' }
        let(:id) do
          user = User.create(name: 'Maria', email: 'maria@example.com', password: 'password', confirmed_at: Time.now)
          Post.create(user: user, title: 'title-first', text: 'test').id
        end
        run_test!
      end
    end
  end
end
