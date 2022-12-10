require 'rails_helper'
RSpec.describe Like, type: :model do
  before :each do
    @user = User.new(name: 'ZikaZaki', photo: 'https://i.imgur.com/1ZQZ1Zm.jpg',
                     bio: 'Full Stack Web Developer', posts_counter: 0)
    @post = Post.new(user: @user, title: 'ZikaZaki first post', content: 'this post is for testing purpuse',
                     comments_counter: 0, likes_counter: 0)
    @like = Like.new(user: @user, post: @post)
  end

  it 'test update_likes_counter' do
    @like.update_likes_counter
    expect(@post.likes_counter).to eq 1
  end
end
