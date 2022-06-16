class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_create :update_likes_count
  after_destroy :update_likes_count

  def update_likes_count
    post.update_likes_count
  end
end
