class Post < ApplicationRecord
  has_many :comment
  has_many :like
  belongs_to :author, class_name: 'User'

  def display_five_recent_comments
    Comment.where(post: self).order(created_at: :desc).first(5)
  end
end
