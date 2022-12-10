require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'user1', photo: 'https://i.imgur.com/1ZQZ1Zm.jpg', bio: 'I am user1', posts_counter: 0) }
  before { subject.save }

  before :all do
    @user1 = User.create(name: 'ZikaZaki', photo: 'https://i.imgur.com/1ZQZ1Zm.jpg', bio: 'Full Stack develoepr',
                         posts_counter: 0)
    @post1 = Post.create(title: 'post1', content: 'I am post1', user: @user1, comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(title: 'post2', content: 'I am post2', user: @user1, comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(title: 'post3', content: 'I am post3', user: @user1, comments_counter: 0, likes_counter: 0)
  end

  it 'is valid with valid attributes' do
    subject.name = 'ZikaZaki'
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name shorter than 3 characters' do
    subject.name = 'aa'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name longer than 20 characters' do
    subject.name = 'aaaaaaaaaaaaaaaaaaaaasssssss'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a posts_counter less than 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid with a posts_counter not an integer' do
    subject.posts_counter = 1.5
    expect(subject).to_not be_valid
  end
end
