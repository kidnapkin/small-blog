# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  title          :string
#  content        :text
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  featured_image :string
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class Post < ApplicationRecord
  include Bootsy::Container
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :featured_image, FeaturedImageUploader
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validate  :featured_image_size
  
  def featured_image_size
    if featured_image.size > 5.megabytes
      errors.add(:featured_image, "should be less than 5MB")
    end
  end

  self.per_page = 10
end
