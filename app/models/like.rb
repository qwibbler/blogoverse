class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_count
    new = Like.where(post_id:).count
    Post.find(post_id).update(likes_counter: new)
  end
end
