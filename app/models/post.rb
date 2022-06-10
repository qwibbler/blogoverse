class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  validates :title, presence: true
  validates :title, length: { maximum: 250 }

  validates :comments_counter, numericality: { only_integer: true }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }

  validates :likes_counter, numericality: { only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def update_posts_count
    user.update_posts_count
  end

  def update_likes_count
    update(likes_counter: likes.count)
  end

  def update_comments_count
    update(comments_counter: comments.count)
  end

  def recent_comments
    comments.limit(5).order(created_at: :asc)
  end

  def liked?(user = @current_user)
    !!likes.find { |like| like.user == user }
  end
end
