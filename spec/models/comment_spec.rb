require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'test', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'user', posts_counter: 0) }
  let(:post) do
    Post.create(title: 'test', text: 'post content', author_id: user.id, comments_counter: 0, likes_counter: 0)
  end
  subject(:comment) { Comment.create(text: 'test', post_id: post.id, author_id: user.id) }

  describe '#update_comment_counter' do
    it 'updates the comments counter for a post' do
      expect(Post.find(post.id).comments_counter).to eq(0)
      comment
      expect(Post.find(post.id).comments_counter).to eq(1)
    end
  end
end
