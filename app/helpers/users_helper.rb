module UsersHelper
  def see_all_btn
    out = ''
    out << link_to('See All Posts', user_posts_path(@user), class: 'btn') if @posts.length > 0
    out.html_safe
  end
end
