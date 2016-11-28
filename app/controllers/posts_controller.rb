class PostsController < ApplicationController

  def new
  end

  def index
    @posts = Posts.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment  = @post.comments.build
    @comment.user_id = current_user.id
  end

  def create

  end

  def update
  end

  def destroy
  end
end
