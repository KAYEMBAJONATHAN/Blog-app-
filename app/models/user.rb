class User < ApplicationRecord
  has_many :likes, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  def show_most_recent_post
    Post.where(author_id: id).order(created_at: :desc).limit(3)
  end
end