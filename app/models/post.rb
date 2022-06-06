class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def update_posts_count
    new = Post.where(user_id:).count
    User.find(user_id).update(posts_counter: new)
  end

  def recent_comments
    Comment.limit(5).where(post_id: id).order(created_at: :asc)
  end
end
