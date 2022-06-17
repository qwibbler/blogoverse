require 'rails_helper'

RSpec.describe 'Posts Page', type: :system do
  before :each do
    @first_user = User.create(name: 'user1', email: 'user1@example.com', password: 'password',
                              photo: 'https://images.unsplash.com/photo-1616587894289-86480e533129',
                              confirmed_at: Time.now)
    @first_post = Post.create(user: @first_user, title: 'title-first', text: 'asdisadokjpsdaposacopasclscmlçcsacsacsa')
    @first_post.update_posts_count

    Comment.create(user: @first_user, post: @first_post, text: '1-comment')
    Comment.create(user: @first_user, post: @first_post, text: '2-comment')
    Comment.create(user: @first_user, post: @first_post, text: '3-comment')
    @first_post.update_comments_count

    Like.create(user: @first_user, post: @first_post)
    @first_post.update_likes_count
  end

  describe 'has index of all posts' do
    before(:example) { visit user_posts_path(@first_user.id) }

    it 'has username' do
      expect(page).to have_content('user1')
    end

    it 'can see the profile picture for the user' do
      expect(page).to have_selector('img[src="https://images.unsplash.com/photo-1616587894289-86480e533129"]')
    end

    it 'can see the number of posts the user has written' do
      expect(page).to have_content('Number Of Posts: 1')
    end

    it "can see a post's title" do
      expect(page).to have_content('title-first')
    end

    it "can see a post's body" do
      expect(page).to have_content('asdisadokjpsdaposacopasclscmlçcsacsacsa')
    end

    it 'can see the first comments on a post' do
      expect(page).to have_content('1-comment')
      expect(page).to have_content('2-comment')
      expect(page).to have_content('3-comment')
    end

    it 'can see how many comments and likes a post has' do
      expect(page).to have_content('Comments: 3, Likes: 1')
    end

    it "redirects to that post's show page when I click on a post" do
      click_link 'title-first'
      expect(page).to have_current_path(user_post_path(@first_user.id, @first_post.id))
    end
  end
end
