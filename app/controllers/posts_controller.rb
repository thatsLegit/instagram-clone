# typed: true

class PostsController < ApplicationController
  # to avoid code repetition
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = 'Your post has been created!'
      redirect_to @post
    else
      flash.now[:alert] = "Your new post couldn't be created! Pleasecheck the form."
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

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
