require 'rails_helper'
RSpec.describe Post, type: :model do
  # user = User.create(name: 'Lilly', Bio: 'teacher in Brazil')
  user = User.create(name: 'Lilly', photo: 'mybaby.png', bio: 'A beautiful beach', posts_counter: 0)
  user.save

  subject do
    Post.new(title: 'My new post', text: 'Hello', user_id: user.id)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject.title).to_not eql 'My new post'
  end

  it 'title shoud be maximum 250 character' do
    subject.title = 'long title' * 50
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -1

    expect(subject).to_not be_valid
  end

  it 'likes_counter should be numeric' do
    subject.likes_counter = ''
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'most_recent_comments should return 0 comment' do
    expect(subject.most_recent_comments.length).to eq 0
  end

  it 'most_recent_comments should always return a total number of 5 comments' do
    expect(subject.most_recent_comments).to eq(subject.comments.last(5))
  end

  it 'user post count should be 0' do
    expect(user.posts_counter).to eq 0
  end

  it 'should update post counter' do
    expect(subject.update_users_posts_counter).to eq true
    expect(subject.user.posts_counter).to eq 2
  end
end
