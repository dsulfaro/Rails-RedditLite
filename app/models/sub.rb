class Sub < ActiveRecord::Base

  validates :moderator, :title, presence: true

  belongs_to :moderator,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :cross_posts,
    class_name: :CrossPost,
    primary_key: :id,
    foreign_key: :sub_id,
    dependent: :destroy,
    inverse_of: :sub

  has_many :posts,
    through: :cross_posts,
    source: :post

end
