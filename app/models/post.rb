class Post < ApplicationRecord
  belongs_to :user

  def update_posts_count(update_user)
    new = post.where(user_id: update_user.id).count
    user.update(posts_counter: new)
  end

  def recent_posts(recent_post);
    comment.limit(5).where(post_id: recent_post.id).order(created_at: :asc)
  end

end