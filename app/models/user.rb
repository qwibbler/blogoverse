class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  def update_posts_count
    new = Post.where(user_id: id).count
    update(posts_counter: new)
  end

  def recent_posts
    Post.limit(3).where(user_id: id).order(created_at: :asc)
  end
end
