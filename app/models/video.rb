class Video < ApplicationRecord
  acts_as_votable

  has_many :comments, as: :commentable

  def user_commented?(current_user)
    self.comments.where(user_id: current_user.id).first.present?
  end
end
