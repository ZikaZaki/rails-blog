class User < ApplicationRecord
  def retrieve_recent_posts
    posts.order(:created_at).limit(3)
  end
end
