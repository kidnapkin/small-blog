class PostsController < ApplicationController

  def new
  end

  def index
    @posts = Posts.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create

  end

  def update
  end

  def destroy
  end
end
