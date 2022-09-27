require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @u = User.create(name: 'Artur', photo: 'google.com', bio: 'I was born in 2055', posts_counter: 0)
    @p = Post.create(title: 'TestTitle', text: 'TestText', comments_counter: 0, likes_counter: 0, user_id: @u.id)
    @comment1 = Comment.create(text: 'First comment', user_id: @u.id, post_id: @p.id)
    @comment2 = Comment.create(text: 'Second comment', user_id: @u.id, post_id: @p.id)
  end
  after(:all) do
    Comment.destroy_all
    User.destroy_all
    Post.destroy_all
  end

  it 'should update comments counter' do
    @p = Post.first
    expect(@p.comments_counter).to eq 0
  end
end
