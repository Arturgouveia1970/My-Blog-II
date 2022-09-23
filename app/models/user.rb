class User < applicationRecord
    has_many :comments, foreign_key: 'user_id', dependent: :destroy
    has_many :likes, foreign_key: 'user_id', dependent: :destroy
    has_many :posts, foreign_key: 'user_id', dependent: :destroy
  
    validates :name, presence: true
    # validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
    def most_recent_posts
      posts.order(created_at: :desc).limit(3)
    end
  
    def three_recent_posts
      posts.includes(:user_id).order(created_at: :desc).limit(3)
    end
  
    def admin?
      role == 'admin'
    end
end