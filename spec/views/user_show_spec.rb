require 'rails_helper'

RSpec.describe 'User1 Page', type: :system do
  before :each do
    @first_user = User.create(name: 'user1', email: 'user1@example.com', password: 'password', bio: 'this is my bio',
                              photo: 'https://images.unsplash.com/photo-1616587894289-86480e533129',
                              confirmed_at: Time.now)
    Post.create(user: @first_user, title: 'title1', text: 'test')
    Post.create(user: @first_user, title: 'title2', text: 'test')
    Post.create(user: @first_user, title: 'title3', text: 'test')
    @last_post = Post.create(user: @first_user, title: 'title4', text: 'test')
    @last_post.update_posts_count
  end

  describe 'Shows User1' do
    before(:example) { visit user_path(@first_user.id) }

    it 'has username' do
      expect(page).to have_content('user1')
    end

    it 'can see the profile picture for user' do
      expect(page).to have_selector('img[src="https://images.unsplash.com/photo-1616587894289-86480e533129"]')
    end

    it 'can see the number of posts each user has written' do
      expect(page).to have_content('Number Of Posts: 4')
    end

    it "has user's bio" do
      expect(page).to have_content('this is my bio')
    end

    it "shows user's first 3 posts" do
      expect(page).to have_content('title4')
      expect(page).to have_content('title3')
      expect(page).to have_content('title2')

      expect(page).to have_no_content('title1')
    end

    it 'shows See All Posts button' do
      expect(page).to have_link('See All Posts', href: user_posts_path(@first_user.id))
    end

    it "redirects to that post's show page when I click on a post" do
      click_link 'title4'
      expect(page).to have_current_path(user_post_path(@first_user.id, @last_post.id))
    end

    it "redirects to posts's index page when I click on a See All button" do
      click_link 'See All Posts'
      expect(page).to have_current_path(user_posts_path(@first_user.id))
    end
  end
end
