module UsersHelper
  def list_users
    out = ''
    out << if @users.empty?
             "<em style='text-align:center;'>
             Currently our 'verse is lonely. Please create users to join our <b>Blogoverse!</b>
             </em>"
           else
             render(partial: 'shared/user', collection: @users)
           end
    out.html_safe
  end

  def bio
    out = ''
    out << if @user.bio.nil? || @user.bio.empty?
             "<em style='text-align:center;'>A lovely member of our <b>Blogoverse!</b> community</em>"
           else
             @user.bio
           end
    out.html_safe
  end

  def see_all_btn
    out = ''
    unless @user.posts_counter.nil? || @user.posts_counter <= 3
      out << link_to('See All Posts', user_posts_path(@user),
                     class: 'btn sketchy', id: 'see_all')
    end
    out.html_safe
  end
end
