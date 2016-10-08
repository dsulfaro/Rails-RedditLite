class CrossPost < ActiveRecord::Base
  validates :post, :sub, presence: true
  validates :post, uniqueness: { scope: :sub,
    message: "post can only be posted to a given sub once." }

  belongs_to :post,
    class_name: :Post,
    primary_key: :id,
    foreign_key: :post_id
    # inverse_of: :cross_posts

  belongs_to :sub,
    class_name: :Sub,
    primary_key: :id,
    foreign_key: :sub_id
    # inverse_of: :cross_posts
end
