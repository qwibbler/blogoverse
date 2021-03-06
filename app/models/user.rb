class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  validates :name, presence: true
  validates :name, length: { in: 3..30 }

  validates :posts_counter, numericality: { only_integer: true }
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  after_save :add_token

  ROLES = %i[admin user].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  def update_posts_count
    update(posts_counter: posts.count)
  end

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  def add_token
    token = JWT.encode email, nil, 'none'
    update_column(:token, token)
  end
end
