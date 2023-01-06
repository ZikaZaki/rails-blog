require 'rails_helper'
RSpec.describe Comment, type: :model do
  before :each do
    @user = User.new(name: 'ZikaZaki', photo: 'https://i.imgur.com/1ZQZ1Zm.jpg',
                     bio: 'Full Stack Web Developer', posts_counter: 0)
    @post = Post.new(author: @user, title: 'ZikaZaki first post', content: 'this post is for testing purpuse',
                     comments_counter: 0, likes_counter: 0)
    @comment = Comment.create(content: 'test comment', author: @user, post: @post)
  end

  it 'test update_comment_counter' do
    @comment.update_comment_counter
    expect(@post.comments_counter).to eq 1
  end
end
