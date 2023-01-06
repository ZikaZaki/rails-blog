require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'test', photo: 'test', bio: 'test', posts_counter: 0)
    @post = Post.create(title: 'test', content: 'test', user_id: @user.id, comments_counter: 0, likes_counter: 0)
    @comment = Comment.create(content: 'this a test comment', user_id: @user.id, post_id: @post.id)
    @like = Like.create(user_id: @user.id, post_id: @post.id)

    visit posts_path(id: @user.id)
  end

  describe 'Post index page' do
    it 'I can see the user profile picture.' do
      find("img[src*='test']")
    end

    it 'I can see the user user name.' do
      expect(page).to have_content(@user.name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(@user.posts_counter)
    end

    it 'I can see a post Title.' do
      expect(page).to have_content(@post.title)
    end

    it 'I can see some of the post body.' do
      expect(page).to have_content(@post.content)
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content('this a test comment')
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content(@post.comments_counter)
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'to show the Pagination buttons' do
      expect(page).to have_content('Pagination')
    end

    it 'When I click on a post, it redirects me to that post show page.' do
      click_link(@post.title)
      expect(current_path).to match user_post_path(id: @user.id, post_id: @post.id)
    end
  end
end
