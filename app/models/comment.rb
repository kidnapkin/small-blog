class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :votes, dependent: :destroy
  has_ancestry
end
