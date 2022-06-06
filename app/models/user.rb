class User < ApplicationRecord
  def recent_posts(recent_user);
    posts.limit(3).where(user_id: recent_user.id).order(created_at: :asc)
  end
end