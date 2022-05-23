class EndUsers::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  before_action :authenticate_end_user!, except: [:top]

  def show
    @end_user = current_end_user
    @posts = Post.all
    @post_user = current_end_user.posts
    @post_favorites = current_end_user.favorites
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to my_page_users_path
    else
      render :edit
    end
  end

  def details
    @end_user = EndUser.find(params[:id])
    @posts = Post.all
    @post_user = @end_user.posts
    @post_favorites = @end_user.favorites
  end

  def unsubscribe
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

 def end_user_params
    params.require(:end_user).permit(:nick_name, :is_deleted, :email, :profile_image)
 end

  def ensure_guest_user
    if current_end_user.nick_name == "ゲストユーザー"
      redirect_to posts_path
    end
  end
end
