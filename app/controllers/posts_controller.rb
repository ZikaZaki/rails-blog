class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @user = User.includes(:posts).find_by(id: params[:id])
    @posts = @user.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find_by(id: params[:post_id])
  end

  # GET /posts/new
  def new
    @new_post = Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.posts_counter += 1
    current_user.save
    @post.user_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      render :new
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    # params.require(:new_post).permit(:title, :content, :user_id)
    params.require(:new_post).permit(:title, :content)
  end
end
