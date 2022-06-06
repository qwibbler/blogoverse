class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_posts_count
    new = Post.where(user_id:).count
    User.find(user_id).update(posts_counter: new)
  end

  def recent_comments
    Comment.limit(5).where(post_id: id).order(created_at: :asc)
  end
end
