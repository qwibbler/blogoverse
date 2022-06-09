class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: params[:user_id]).order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
    @comment = @post.comments.build
    @like = @post.likes.build
  end

  def new
    render :new, locals: { post: Post.new }
  end

  def create
    @new_post = @current_user.posts.new(params.require(:post).permit(:title, :text))
    if @new_post.save
      flash[:success] = t('post_success')
      @new_post.update_posts_count
      redirect_to [@current_user, @new_post]
    else
      flash.now[:error] = t('post_error')
      render :new, locals: { post: @new_post }
    end
  end
end
