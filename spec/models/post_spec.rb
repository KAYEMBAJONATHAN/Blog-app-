require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'John Doe', photo: 'photo_url', bio: 'bio_text', posts_counter: 0)
  subject do
    Post.create(title: 'Test', text: 'Post content', author_id: user.id, comments_counter: 0, likes_counter: 0)
  end

  it 'title must be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should be greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should be greater than or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should update the PostCounter attribute of the associated user' do
    expect(user.posts_counter).to eq(0)

    subject

    expect(user.reload.posts_counter).to eq(1)
  end

  describe '#recent_comments' do
    it 'returns the 5 most recent comments for a given post' do
      6.times do |i|
        subject.comments.create(text: "Comment #{i}", author_id: user.id)
      end
      expect(subject.recent_comments.count).to eq(5)
      expect(subject.recent_comments.first.text).to eq('Comment 5')
      expect(subject.recent_comments.last.text).to eq('Comment 1')
    end
  end
end
