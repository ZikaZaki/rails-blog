require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before(:example) do
    @user = User.create(name: 'test', photo: 'test', bio: 'test', posts_counter: 0)
    @post = Post.create(title: 'test', content: 'test', user_id: @user.id, comments_counter: 0, likes_counter: 0)

    Post.create(title: 'test1', content: 'test1', author: @user, comments_counter: 0, likes_counter: 0)
    Post.create(title: 'test2', content: 'test2', author: @user, comments_counter: 0, likes_counter: 0)
    Post.create(title: 'test3', content: 'test3', author: @user, comments_counter: 0, likes_counter: 0)
    @user.posts_counter += 1
    @user.save
    visit user_path(id: @user.id)
  end

  describe 'index page' do
    it 'display the users profile picture.' do
      find("img[src='#{@user.photo}']")
    end

    it 'display the users username.' do
      expect(page).to have_content(@user.name)
    end

    it 'display the number of posts the user has written.' do
      expect(page).to have_content(@user.posts_counter)
    end

    it 'display the user bio.' do
      expect(page).to have_content(@user.bio)
    end

    it 'display the users first post.' do
      expect(page).to have_content('test1')
    #   expect(page).to have_content('test2')
    #   expect(page).to have_content('test3')
    end

    it 'display a button that lets me view all of a users posts.' do
      expect(page).to have_link('See All Posts') if @user.posts_counter > 0
    end

    it 'When a post is clicked, it redirects me to that posts show page.' do
      visit posts_path(id: @user.id)
    #   click_link(@post.title)
    #   expect(current_path).to eq user_post_path(id: @user.id, post_id: @post.id)
    end

    it 'When See All Posts button clicked, it redirects me to the users posts index page.' do
      if @user.posts_counter > 0
        click_link('See All Posts')
        expect(current_path).to eq "/users/#{@user.id}/posts/"
      else
        expect(page).to have_content('No posts yet')
      end
    end
  end
end
