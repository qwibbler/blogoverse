require 'rails_helper'

RSpec.describe PagesController do
  it 'home responds correctly' do
    get :home
    expect(response.status).to eq(200)
  end
end
