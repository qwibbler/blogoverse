module UsersHelper
  def see_all_btn
    out = ''
    unless @user.posts_counter.nil? || @user.posts_counter <= 3
      out << link_to('See All Posts', user_posts_path(@user),
                     class: 'btn')
    end
    out.html_safe
  end
end
