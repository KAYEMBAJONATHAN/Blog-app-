require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:user) { User.create(name: 'Elham', photo: 'https://i.pravatar.cc/300?u=elham', bio: 'I am a software engineer.', posts_counter: 0) }
  subject(:post) do
    user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
  end

  subject(:like) { user.likes.create(post_id: post.id) }
  describe '#update_like_counter' do
    it 'updates the likes counter for a post' do
      expect(Post.find(post.id).likes_counter).to eq(0)
      like # call the like variable to trigger the after_save callback
      expect(Post.find(post.id).likes_counter).to eq(1)
    end
  end
end
