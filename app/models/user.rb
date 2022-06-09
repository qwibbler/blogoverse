class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  validates :name, presence: true
  validates :name, length: { in: 3..30 }

  validates :posts_counter, numericality: { only_integer: true }
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def update_posts_count
    new = Post.where(user_id: id).count
    update(posts_counter: new)
  end

  def recent_posts
    Post.limit(3).where(user_id: id).order(created_at: :asc)
  end
end
