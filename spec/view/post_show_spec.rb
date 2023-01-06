require 'rails_helper'
RSpec.describe 'renders post index Page', type: :feature do
    before(:each) do
        @user = User.create(name: 'test', photo: 'test', bio: 'test', posts_counter: 0)
        @post = Post.create(title: 'test', content: 'test', user_id: @user.id, comments_counter: 0, likes_counter: 0)
        @comment = Comment.create(content: 'test', user_id: @user.id, post_id: @post.id)
        @like = Like.create(user_id: @user.id, post_id: @post.id)

        visit user_post_path(id: @user.id, post_id: @post.id)
    end

    describe 'post index page' do
        it 'displays the post title' do
            expect(page).to have_content(@post.title)
        end

        it 'displays the post author name' do
            expect(page).to have_content(@user.name)
        end

        it 'displays the post comments counter' do
            expect(page).to have_content(@post.comments_counter)
        end

        it 'displays the post likes counter' do
            expect(page).to have_content(@post.likes_counter)
        end

        it 'displays the post content' do
            expect(page).to have_content(@post.content)
        end

        it 'displays the commenter name' do
            expect(page).to have_content(@user.name)
        end

        it 'displays the comment content' do
            expect(page).to have_content(@comment.content)
        end
    end
end