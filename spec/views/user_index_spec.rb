require 'rails_helper'

RSpec.describe 'Login Page', type: :system do
  describe 'has  email and password inputs and the "Submit" button.' do
    before_action { visit new_user_session_path }
    it 'has label for email' do
      expect(page).to have_content('Email')
    end
    it 'has label for password' do
      expect(page).to have_content('Password')
    end
    it 'has input for email' do
      expect(page).to have_selector('input[type="email"]')
    end
    it 'has input for password' do
      expect(page).to have_selector('input[type="password"]')
    end
    it 'has button for login' do
      expect(page).to have_selector('input[type="submit"]')
    end
  end
end