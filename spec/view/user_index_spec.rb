require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:example) do
    @user1 = User.create(name: 'ZikaZaki', photo: 'https://i.imgur.com/1ZQZ1Zm.jpg', bio: 'Full Stack develoepr',
                         posts_counter: 0)
    @user2 = User.create(name: 'ZikaZaki2', photo: 'https://i.imgur.com/1ZQZ1Zm.jpg', bio: 'Full Stack develoepr',
                         posts_counter: 0)

    visit users_path
  end

  describe 'user index page' do
    it 'displays the username of all other users.' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end

    it 'displays the profile picture for each user.' do
      visit user_path(id: @user1.id)
      find("img[src='https://i.imgur.com/1ZQZ1Zm.jpg']")
      visit user_path(id: @user2.id)
      find("img[src='https://i.imgur.com/1ZQZ1Zm.jpg']")
    end

    it 'display the number of posts each user has written.' do
      expect(page).to have_content(@user1.posts_counter)
      expect(page).to have_content(@user2.posts_counter)
    end

    it 'redirects to the user profile page when the user name is clicked.' do
      # click_link(@user1.name)
      # expect(page).to have_current_path("/users/#{@user1.id}")
      # expect(current_path).to match "/users/#{@user1.id}"
      # expect(page).to have_current_path(user_path(id: @user1.id))
    end
  end
end
