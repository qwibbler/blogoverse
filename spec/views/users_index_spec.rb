# require 'rails_helper'

# RSpec.describe 'Users Page', type: :system do
#   before :each do
#     @first_user = User.create(name: 'user1', email: 'user1@example.com', password: 'password',
#                               photo: 'https://images.unsplash.com/photo-1616587894289-86480e533129',
#                               confirmed_at: Time.now)
#     User.create(name: 'user2', email: 'user2@example.com', password: 'password',
#                 photo: 'https://images.unsplash.com/photo-1503945438517-f65904a52ce6',
#                 confirmed_at: Time.now)
#     @first_post = Post.create(user: @first_user, title: 'title-first', text: 'test')
#     @first_post.update_posts_count
#   end

#   describe 'has index of all users' do
#     before(:example) { visit users_path }

#     it 'has all usernames' do
#       expect(page).to have_content('user1')
#       expect(page).to have_content('user2')
#     end

#     it 'can see the profile picture for each user' do
#       expect(page).to have_selector('img[src="https://images.unsplash.com/photo-1616587894289-86480e533129"]')
#       expect(page).to have_selector('img[src="https://images.unsplash.com/photo-1503945438517-f65904a52ce6"]')
#     end

#     it 'can see the number of posts each user has written' do
#       expect(page).to have_content('Number Of Posts: 1')
#       expect(page).to have_content('Number Of Posts: 0')
#     end

#     it "redirects to that user's show page when I click on a user" do
#       click_link 'user1'
#       expect(page).to have_current_path(user_path(@first_user.id))
#     end
#   end
# end
