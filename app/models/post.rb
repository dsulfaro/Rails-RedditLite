class Post < ActiveRecord::Base

  validates :author, :title, :subs, presence: true


  belongs_to :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :cross_posts,
    class_name: :CrossPost,
    primary_key: :id,
    foreign_key: :post_id,
    dependent: :destroy,
    inverse_of: :post

  has_many :subs,
    through: :cross_posts,
    source: :sub

end
