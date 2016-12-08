# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  comment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_votes_on_comment_id  (comment_id)
#  index_votes_on_user_id     (user_id)
#

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  validates :user_id, presence: true
  validates :comment_id, presence: true
  validates :user_id, uniqueness: { scope: :comment_id }
end
