class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_comments_count
  after_destroy :update_comments_count

  def update_comments_count
    post.update_comments_count
  end
end
