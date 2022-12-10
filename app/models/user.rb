class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true } 

  def retrieve_recent_posts
    posts.order(:created_at).limit(3)
  end
end
