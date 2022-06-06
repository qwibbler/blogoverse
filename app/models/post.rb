class Post < ApplicationRecord
  belongs_to :user

  def update_posts_count
    user = self.user_id
    new = Post.where(user_id: user).count
    User.find(user).update(posts_counter: new)
  end

  def recent_comments
    Comment.limit(5).where(post_id: self.id).order(created_at: :asc)
  end
end
