module VotesHelper
  def voted?(comment)
    voted_comment = current_user.votes.find_by(comment_id: comment.id)
    true if voted_comment
  end
end
