class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to root_url
    else
      render 'pages/home'
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end