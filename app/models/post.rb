class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

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
