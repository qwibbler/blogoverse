require 'rails_helper'

RSpec.describe PagesController, type: :request do
  before(:example) { get '/' }

  it 'home responds correctly' do
    expect(response.status).to eq(200)
  end

  it 'shows correct text' do
    expect(response.body).to include('Home page with users and posts')
  end
end
