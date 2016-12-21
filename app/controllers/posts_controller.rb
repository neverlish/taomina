class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @posts = Post.all
    # @products = Post.where(category: "Product")
    # @collaborations = Post.where(category: "Collaboration")
    # @consultings = Post.where(category: "Consulting")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to :back
    else
      render :new
    end
  end

  def edit
    session[:prev_url] = request.referer
  end

  def update
    if @post.update(post_params)
      redirect_to session[:prev_url]
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
