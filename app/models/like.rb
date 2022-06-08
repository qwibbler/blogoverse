class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_count
    post.update_likes_count
  end
end
