class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 5).order(created_at: :desc).includes(comments: [:user])
    # @posts = Post.paginate(page: params[:page], per_page: 5)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :asc).includes(:user)

    @comment = @post.comments.build
    @like = @post.likes.build
  end

  def new
    render :new, locals: { post: Post.new }
  end

  def create
    @new_post = current_user.posts.new(params.require(:post).permit(:title, :text))
    if @new_post.save
      redirect_to [current_user, @new_post], notice: t('post_success')
    else
      flash.now[:error] = t('post_error')
      render :new, locals: { post: @new_post }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    user = @post.user
    @post.destroy
    redirect_to user_posts_path(user), notice: t('post_deleted')
  end
end
