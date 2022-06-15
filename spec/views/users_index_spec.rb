require 'rails_helper'

RSpec.describe 'Hello world', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      p 'visited'
      sleep(5)
      p 'slept'
      expect(page).to have_content(t('no_users'))
    end
  end
end