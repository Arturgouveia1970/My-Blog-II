class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_posts_likes_counter
    post.increment(:likes_counter, 1)
  end

  #  def update_posts_likes_counter(post)
  #   post.likes_counter += 1
  # end
end
