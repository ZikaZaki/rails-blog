class Post < ApplicationRecord
  belongs_to :user

  def self.update_post_counter(user, new_value)
    Post.find_by(user:).user.update(posts_counter: new_value)
  end

  def retrieve_recent_comments
    comments.order(:created_at).limit(5)
  end
end