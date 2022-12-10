class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def self.update_comment_counter(post, new_value)
    Comment.find_by(post:).post.update(commnets_counter: new_value)
  end
end
