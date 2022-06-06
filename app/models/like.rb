class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_count(update_post)
    new = like.where(post_id: update_post.id).count
    post.update(likes_counter: new)
  end
end