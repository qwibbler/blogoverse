class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 5).order(created_at: :desc).includes(comments: [:user])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :asc).includes(:user)

    @comment = @post.comments.build
    @like = @post.likes.build
  end

  def new
    @post = Post.new
    @url = user_posts_path(current_user.id)
  end

  def create
    @new_post = current_user.posts.new(post_params)
    if @new_post.save
      redirect_to [current_user, @new_post], notice: t('post_success')
    else
      flash.now[:error] = t('post_error')
      render :new, locals: { post: @new_post }
    end
  end

  def edit
    @post = Post.find(params[:id])
    @url = user_post_path(current_user.id, @post)
    render :new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to [current_user, @post], notice: t('edit_success')
    else
      flash.now[:error] = t('edit_error')
      render :new, locals: { post: @post }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    user = @post.user
    @post.destroy
    redirect_to user_posts_path(user), notice: t('post_deleted')
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
