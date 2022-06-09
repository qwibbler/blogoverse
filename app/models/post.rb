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
    new = Like.where(post_id: id).count
    update(likes_counter: new)
  end

  def update_comments_count
    new = Comment.where(post_id: id).count
    update(comments_counter: new)
  end

  def recent_comments
    Comment.limit(5).where(post_id: id).order(created_at: :asc)
  end

  def liked?(user = @current_user)
    !!likes.find { |like| like.user == user }
  end
end
