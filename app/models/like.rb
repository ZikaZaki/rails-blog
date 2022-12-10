class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_like_counter(post, new_value)
    Like.find_by(post:).post.update(likes_counter: new_value)
  end
end
