require 'rails_helper'

RSpec.describe 'Users Page', type: :system do
  before :each do
    User.make(name:'user1', email: 'user1@example.com', password: 'password')
    User.make(name:'user2', email: 'user2@example.com', password: 'password')
  end

  describe 'has index of all users' do
    before(:example) { visit new_user_session_path }
    it 'has all usernames' do
      expect(page).to have_content('user1', 'user2')
    end
    # it 'has label for password' do
    #   expect(page).to have_content('Password')
    # end
    # it 'has input for email' do
    #   expect(page).to have_selector('input[type="email"]')
    # end
    # it 'has input for password' do
    #   expect(page).to have_selector('input[type="password"]')
    # end
    # it 'has button for login' do
    #   expect(page).to have_selector('input[type="submit"]')
    # end
  end
end