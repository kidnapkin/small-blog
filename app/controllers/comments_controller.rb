class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      render 'pages/home'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id, :parent_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
