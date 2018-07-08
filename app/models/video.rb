# == Schema Information
#
# Table name: videos
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  image_url    :string           not null
#  published_at :datetime         not null
#  title        :string           not null
#  description  :text
#  youtube_id   :integer          not null
#

class Video < ApplicationRecord
  acts_as_votable

  has_many :comments, as: :commentable

  def user_commented?(current_user)
    self.comments.where(user_id: current_user.id).first.present?
  end
end
