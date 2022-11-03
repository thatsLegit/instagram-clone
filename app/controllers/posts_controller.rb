# typed: true

class PostsController < ApplicationController
  # to avoid code repetition
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]

  def index
    @posts = Post.all.order('created_at DESC').page(params[:page])
  end

  def show; end

  # current_user is a Devise helper method that gives the currently logged in user
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = 'Your post has been created!'
      redirect_to @post
    else
      flash.now[:alert] = "Your new post couldn't be created! Please check the form."
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated.'
      redirect_to @post
    else
      flash.now[:alert] = 'Update failed. Please check the form.'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Your post has been deleted!'
    redirect_to root_path
  end

  # if you put private here, all below defined function are private
  private

  def authorize_user
    redirect_to root_path if current_user.id != @post.user.id
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
