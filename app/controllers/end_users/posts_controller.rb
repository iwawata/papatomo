class EndUsers::PostsController < ApplicationController
   before_action :ensure_guest_user, only: [:new]
   before_action :authenticate_end_user!, except: [:top]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    @genres = Genre.all
    if params[:genre_id] != nil
      @posts = @posts.where(genre_id: params[:genre_id])
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.end_user_id = current_end_user.id
    if @post.save
      redirect_to posts_path
    else
     render :new
    end
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption, :profile_image, :genre_id)
  end
  def ensure_guest_user
    if current_end_user.nick_name == "ゲストユーザー"
      redirect_to posts_path
    end
  end
end
