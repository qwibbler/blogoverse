module UsersHelper
  def list_users
    out = ''
    out << if @users.empty?
             "<em style='text-align:center;'> #{t('no_users')} <b>Blogoverse!</b></em>"
           else
             render(partial: 'shared/user', collection: @users)
           end
    out.html_safe
  end

  def bio
    out = ''
    out << if @user.bio.nil? || @user.bio.empty?
             t('no_bio')
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
