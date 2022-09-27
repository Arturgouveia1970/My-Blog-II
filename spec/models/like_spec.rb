require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Lilly', photo: 'mybaby.png', bio: 'A beautiful beach',
                     posts_counter: 0)
  post = Post.create(user_id: user.id, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                     comments_counter: 0)

  like = Like.new(post_id: post.id, user_id: user.id)
  like.save

  it 'should update likes counter' do
    expect(subject.update_posts_likes_counter).to eq true
    expect(subject.post.LikesCounter).to eq 2
  end
end
