class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_count(update_post)
    new = comment.where(post_id: update_post.id).count
    post.update(comments_counter: new)
  end
end