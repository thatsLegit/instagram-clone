class PaginateCommentsController < ApplicationController
  def index
    @current_page = params[:page]
    @comments = Post.page(@current_page).per(2)
  end
end
