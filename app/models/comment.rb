class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_count
    post.update_comments_count
  end
end
