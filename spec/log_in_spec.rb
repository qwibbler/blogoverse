require 'rails_helper'

RSpec.describe 'Login Page', type: :system do
  describe 'has email and password inputs and the "Submit" button.' do
    before(:example) { visit new_user_session_path }
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

  describe 'When I click the submit button' do
    before(:example) { visit new_user_session_path }

    it 'gets a detailed error when without filling in the username and the password' do
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'gets a detailed error after filling in the username and the password with incorrect data' do
      User.create(name: 'user', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      within("#new_user") do
        fill_in 'Email', with: 'wrong_user@example.com'
        fill_in 'Password', with: 'wrong_password'
      end

      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'redirect to root pg after filling in the username and the password with correct data' do
      User.create(name: 'user', email: 'user@example.com', password: 'password', confirmed_at: Time.now)
      within("#new_user") do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end

      click_button 'Log in'

      expect(page).to have_current_path(root_path)
    end
  end
end
