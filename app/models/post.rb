class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  def count_post_by_user
    user.update(post_counter: user.posts.count)
  end

  def comments_per_post
    comments.order(created_at: :desc).limit(5)
  end
end
