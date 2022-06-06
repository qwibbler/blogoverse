class User < ApplicationRecord
  def recent_posts(user);
    posts.limit(3).where(user_id: user.id).order(created_at: :asc)
  end
end