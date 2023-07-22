require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'test', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'user', post_counter: 0) }
  let(:post) do
    Post.create(title: 'test', text: 'post content', author_id: user.id, comments_counter: 0, likes_counter: 0)
  end
  subject { Comment.create(text: 'test', post_id: post.id, users_id: user.id) }

  it 'should increments comments_counter by 1' do
    expect { subject.send(:update_post_comments_counter) }.to change { post.reload.comments_counter }.by(1)
  end
end
