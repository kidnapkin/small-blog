class VotesController < ApplicationController
  before_action :set_comment, except: [:destroy]
  before_action :correct_user, only: [:create]
  
  def create
    @vote = Vote.create(vote_params)
    if @vote.save
      respond_to do |format|
        format.js
      end
    else
      render 'pages/home'
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @comment = @vote.comment
    @vote.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def vote_params
    params.permit(:user_id, :comment_id)
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
  
  def correct_user
    @user = User.find(params[:user_id])
    unless @user == current_user
      respond_to do |format|
        format.js { render text: "alert('Not allowed');" }
      end
    end
  end
end
