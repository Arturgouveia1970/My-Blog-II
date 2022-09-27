require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'Lilly', photo: 'mybaby.png', bio: 'A beautiful beach', posts_counter: '5') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should be numeric' do
    subject.post_counter = 'h'

    expect(subject).to_not be_valid
  end

  it 'post_counter should be greater than or equal to 0' do
    subject.post_counter = -1

    expect(subject).to_not be_valid
  end
  it 'should list three recent posts' do
    4.times do |i|
      Post.create(title: 'hello', text: "this is my #{i}th post", comments_counter: 0, likes_counter: 0,
                  user_id: subject)
    end
    expect(subject.most_recent_posts.length).to eq 0
  end
end
