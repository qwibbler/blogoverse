module PostsHelper
  def list_comments(comments = @comments)
    out = ''
    out << render(partial: 'shared/comments', object: comments) unless comments.empty?
    out.html_safe
  end
end
