class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :likes

  def retrieve_recent_posts
    posts.order(:created_at).limit(3)
  end
end
