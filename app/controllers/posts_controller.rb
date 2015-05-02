class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]
  before_action :require_creator, only: [:edit, :update]

  def index
    @posts = Post.all.reverse
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      flash[:notice] = 'Your post was created'
      redirect_to root_url
    else
      render :new
    end
  end

  def edit ; end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Your post was updated'
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find_by slug: params[:id]
  end

  def require_creator
    access_denied unless signed_in? && (
    current_user == @post.creator || current_user.admin?)
  end
end
