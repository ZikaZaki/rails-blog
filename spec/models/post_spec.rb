require 'rails_helper'
RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'Hello', content: 'I am ZikaZaki and this is my first post', comments_counter: 8, likes_counter: 15)
  end
  before { subject.save }

  before :all do
    @user = User.new(name: 'ZikaZaki', photo: 'https://i.imgur.com/1ZQZ1Zm.jpg',
                     bio: 'Full Stack Web Developer', posts_counter: 0)
    @post = Post.new(user: @user, title: 'ZikaZaki first post', content: 'this post is for testing only',
                     comments_counter: 0, likes_counter: 0)
    @comment1 = Comment.create(content: 'c1', user: @user, post: @post)
    @comment2 = Comment.create(content: 'c2', user: @user, post: @post)
    @comment3 = Comment.create(content: 'c3', user: @user, post: @post)
    @comment4 = Comment.create(content: 'c4', user: @user, post: @post)
    @comment5 = Comment.create(content: 'c5', user: @user, post: @post)
  end

  it 'test retrieve_recent_comments' do
    array = @post.retrieve_recent_comments
    expect(array.length).to eq 5
  end

  it 'test update_post_counter' do
    @post.update_post_counter
    expect(@user.posts_counter).to eq 1
  end

  it 'title  must not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must not exceed 250 characters' do
    subject.title = 'x' * 251
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer' do
    subject.comments_counter = 'x'
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be greater than or equal to zero.' do
    subject.comments_counter = -7
    expect(subject).to_not be_valid
  end

  it 'likes_counter  must be an integer' do
    subject.likes_counter = 'x'
    expect(subject).to_not be_valid
  end

  it 'likes_counter  must be greater than or equal to zero.' do
    subject.likes_counter = -7
    expect(subject).to_not be_valid
  end
end
