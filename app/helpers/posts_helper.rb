module PostsHelper
  def list_comments(comments = @comments)
    out = ''
    out << render(partial: 'shared/comments', object: comments) unless comments.empty?
    out.html_safe
  end

  def like_btn
    return unless current_user

    if @post.liked?(current_user)
      button_to(
        t('liked'),
        user_post_like_path(@post.user, @post, @post.likes.find_by(user: current_user)),
        method: :delete,
        class: 'btn sketchy'
      )
    else
      button_to(t('like'), user_post_likes_path(@post.user, @post), method: :post, class: 'btn sketchy')
    end
  end
end
