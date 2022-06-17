# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'API Comments', type: :request do
  path '/api/posts/{id}/comments' do
    get 'Retrieves all comments of a post' do
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
          User.create(name: 'Jason', email: 'jason@example.com', password: 'password', confirmed_at: Time.now).token
        end

        let(:id) do
          user = User.create(name: 'Maria', email: 'maria@example.com', password: 'password', confirmed_at: Time.now)
          Post.create(user:, title: 'title-first', text: 'test').id
        end
        run_test!
      end

      response '400', 'Invalid Token' do
        let(:token) { '0' }
        let(:id) do
          user = User.create(name: 'Maria', email: 'maria@example.com', password: 'password', confirmed_at: Time.now)
          Post.create(user:, title: 'title-first', text: 'test').id
        end
        run_test!
      end
    end

    post 'Posts a new comment' do
      tags 'Comments'
      consumes 'multipart/form-data'
      parameter name: :id, in: :path, type: :string, required: true
      parameter name: :token, in: :formData, type: :string, required: true
      parameter name: :text, in: :formData, type: :string, required: true

      response '201', 'Created' do
        schema type: :object,
               properties: {
                 success: { type: :boolean },
                 data: {
                   type: :object,
                   properties: {
                     comment: {
                       type: :object,
                       properties: {
                         id: { type: :integer },
                         user_id: { type: :integer },
                         post_id: { type: :integer },
                         text: { type: :string },
                         created_at: { type: :datetime },
                         updated_at: { type: :datetime }
                       },
                       required: %w[id user_id post_id text created_at updated_at]
                     }
                   }
                 }
               },
               required: []
        let(:token) do
          User.create(name: 'Jason', email: 'jason@example.com', password: 'password', confirmed_at: Time.now).token
        end

        let(:id) do
          user = User.create(name: 'Maria', email: 'maria@example.com', password: 'password', confirmed_at: Time.now)
          Post.create(user:, title: 'title-first', text: 'test').id
        end

        let(:text) { 'This is the comment.' }
        run_test!
      end

      response '400', 'Invalid Token' do
        let(:token) { '0' }
        let(:text) { 'This is the comment' }
        let(:id) do
          user = User.create(name: 'Maria', email: 'maria@example.com', password: 'password', confirmed_at: Time.now)
          Post.create(user:, title: 'title-first', text: 'test').id
        end
        run_test!
      end

      response '400', 'Comment must have text' do
        let(:token) do
          User.create(name: 'Jason', email: 'jason@example.com', password: 'password', confirmed_at: Time.now).token
        end
        let(:text) { nil }
        let(:id) do
          user = User.create(name: 'Maria', email: 'maria@example.com', password: 'password', confirmed_at: Time.now)
          Post.create(user:, title: 'title-first', text: 'test').id
        end
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
