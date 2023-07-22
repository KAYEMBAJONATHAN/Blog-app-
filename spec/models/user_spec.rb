require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'test', photo: 'photo1', bio: 'bio', posts_counter: 0) }

  it 'name must be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'returns the most recent 3 posts' do
    subject.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
    subject.posts.create(title: 'Post 2', text: 'This is the second post.', comments_counter: 0, likes_counter: 0)
    subject.posts.create(title: 'Post 3', text: 'This is the third post.', comments_counter: 0, likes_counter: 0)
    recent_posts = subject.recent_posts
    expect(recent_posts.length).to eq(3)
  end
end
