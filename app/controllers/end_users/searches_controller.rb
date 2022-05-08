class EndUsers::SearchesController < ApplicationController
  before_action :authenticate_end_user!

  def search
    @genres = Genre.all
    @posts = Post.where("caption LIKE?","%#{params[:word]}%")
  end
end
