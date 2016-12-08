class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @post = Post.new
    render layout: 'pages'
  end

  def index
    @posts = Posts.paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to root_url
    else
      render 'pages/home'
    end
  end

  def update
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to request.referer || root_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :bootsy_image_gallery_id, :featured_image)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
