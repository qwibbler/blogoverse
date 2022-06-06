class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_count
    new = Comment.where(post_id: self.post_id).count
    Post.update(comments_counter: new)
  end
end
