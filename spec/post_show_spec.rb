require 'rails_helper'

RSpec.describe 'Post1 Page', type: :system do
  before :each do
    @first_user = User.create(name: 'user1', email: 'user1@example.com', password: 'password',
                              photo: 'https://images.unsplash.com/photo-1616587894289-86480e533129',
                              confirmed_at: Time.now)
    @second_user = User.create(name: 'user2', email: 'user2@example.com', password: 'password',
                               photo: 'https://images.unsplash.com/photo-1616587894289-86480e533129',
                               confirmed_at: Time.now)
    @third_user = User.create(name: 'user3', email: 'user3@example.com', password: 'password',
                              photo: 'https://images.unsplash.com/photo-1616587894289-86480e533129',
                              confirmed_at: Time.now)
    @first_post = Post.create(user: @first_user, title: 'title-first', text: 'asdisadokjpsdaposacopasclscmlçcsacsacsa')
    @first_post.update_posts_count

    Comment.create(user: @second_user, post: @first_post, text: '1-comment')
    Comment.create(user: @third_user, post: @first_post, text: '2-comment')
    @first_post.update_comments_count

    Like.create(user: @first_user, post: @first_post)
    @first_post.update_likes_count
  end

  describe 'Shows User1' do
    before(:example) { visit user_post_path(@first_user.id, @first_post.id) }

    it "can see a post's title" do
      expect(page).to have_content('title-first')
    end

    it 'has author name' do
      expect(page).to have_content('user1')
    end

    it 'can see how many comments and likes a post has' do
      expect(page).to have_content('Comments: 2, Likes: 1')
    end

    it "can see a post's body" do
      expect(page).to have_content('asdisadokjpsdaposacopasclscmlçcsacsacsa')
    end

    it 'can see username of each commentor' do
      expect(page).to have_content('user2')
      expect(page).to have_content('user3')
    end

    it 'can see each comment on a post' do
      expect(page).to have_content('1-comment')
      expect(page).to have_content('2-comment')
    end
  end
end
