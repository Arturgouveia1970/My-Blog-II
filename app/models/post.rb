class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :author_id

  has_many :comments
  has_many :likes

  # validates :title, presence: true, length: { maximum: 250 }
  # validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :title, length: { maximum: 250 }

  # after_save :update_users_posts_counter

  def update_users_posts_counter
    author_id.update(posts_counter: user.posts.count)
  end

  # def last_five_comment
  #   comments.includes(:post).order(created_at: :desc).limit(5)
  # end

  def most_recent_comments
    comments.includes(:post).order(created_at: :desc).limit(5)
  end
end
