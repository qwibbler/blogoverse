require 'swagger_helper'

comment_info = {
  id: { type: :integer },
  user_id: { type: :integer },
  post_id: { type: :integer },
  text: { type: :string },
  created_at: { type: :datetime },
  updated_at: { type: :datetime }
}

jason = User.create(name: 'Jason', email: 'jason@example.com', password: 'password', confirmed_at: Time.now)
post = Post.create(user: jason, title: 'title-first', text: 'test').id

RSpec.describe 'API Comments', type: :request do
  path '/api/posts/{id}/comments' do
    get 'Retrieves all comments of a post' do
      tags 'Show all comments'
      consumes 'multipart/form-data'
      parameter name: :id, in: :path, type: :string, required: true
      parameter name: :token, in: :formData, type: :string, required: true

      response '200', 'OK' do
        schema type: :array, items: comment_info, required: %w[id user_id post_id text created_at updated_at]
        let(:token) { jason.token }
        let(:id) { post.id }
        run_test!
      end

      response '400', 'Invalid Token' do
        let(:token) { '0' }
        let(:id) { post.id }
        run_test!
      end
    end

    post 'Posts a new comment' do
      tags 'Post new comment'
      consumes 'multipart/form-data'
      parameter name: :id, in: :path, type: :string, required: true
      parameter name: :token, in: :formData, type: :string, required: true
      parameter name: :text, in: :formData, type: :string, required: true

      response '201', 'Created' do
        schema type: :object, properties: {
          success: { type: :boolean },
          data: {
            type: :object, properties: {
              comment: {
                type: :object, properties: comment_info,
                required: %w[id user_id post_id text created_at updated_at]
              }
            }
          }
        },
               required: []
        let(:token) { jason.token }
        let(:id) { post.id }
        let(:text) { 'This is the comment.' }
        run_test!
      end

      response '400', 'Invalid Token' do
        let(:token) { '0' }
        let(:text) { 'This is the comment' }
        let(:token) { jason.token }
        run_test!
      end

      response '400', 'Comment must have text' do
        let(:token) { jason.token }
        let(:id) { post.id }
        let(:text) { nil }
        run_test!
      end
    end
  end
end
