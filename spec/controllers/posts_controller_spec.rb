require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'Index: ' do
    before(:example) { get '/users/1/posts' }
    it 'responds correctly' do
      expect(response.status).to eq(200)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'Show: ' do
    before(:example) { get '/users/1/posts/1' }
    it 'responds correctly' do
      expect(response.status).to eq(200)
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end
  end
end
