class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'
  after_save :update_posts_counter

  def display_five_recent_comments
    Comment.where(post: self).order(created_at: :desc).first(5)
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
