class PaginatePostsController < ApplicationController
  def index
    @current_page = params[:page]
    @posts = Post.page(@current_page).per(2)
  end
end
