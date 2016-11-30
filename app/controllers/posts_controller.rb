class PostsController < ApplicationController
  def new
  end

  def index
    @posts = Posts.paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def create
  end

  def update
  end

  def destroy
  end
end
