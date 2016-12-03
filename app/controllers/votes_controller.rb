class VotesController < ApplicationController
  def create
    @vote = current_user.votes.build(vote_params)
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
end
