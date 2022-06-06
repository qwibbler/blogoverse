class User < ApplicationRecord
  def recent_posts
    Post.limit(3).where(user_id: self.id).order(created_at: :asc)
  end
end
