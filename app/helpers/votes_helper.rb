module VotesHelper
  def voted?(comment)
    comment.votes.where(user_id: current_user.id).any?
  end

  def author?(comment)
    comment.user == @post.user
  end
end