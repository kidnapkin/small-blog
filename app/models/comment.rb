# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ancestry   :string
#
# Indexes
#
#  index_comments_on_ancestry  (ancestry)
#  index_comments_on_post_id   (post_id)
#  index_comments_on_user_id   (user_id)
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many   :votes, dependent: :destroy
  has_ancestry

  delegate :id, :name, :email, to: :user, prefix: true
end
