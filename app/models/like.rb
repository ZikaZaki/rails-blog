class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def self.update_like_counter(post, new_value)
    Like.find_by(post:).post.update(likes_counter: new_value)
  end
end
