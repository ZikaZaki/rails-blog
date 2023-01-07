class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find_by(id: params[:id])
  end

  def show
    @post = Post.find_by(id: params[:post_id])
    respond_to do |format|
      format.html
      format.json do
        if current_user.id == params[:id].to_i
          render json: @post.comments
        else
          render html: "You don't have permission to see this page"
        end
      end
    end
  end

  def new
    @new_post = Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.posts_counter += 1
    current_user.save
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      render :new
    end
  end

  def destroy
    current_post = Post.find_by(id: params[:post_id])
    authorize! :destroy, current_post

    current_post.comments.each(&:destroy)
    current_post.likes.each(&:destroy)

    current_post.destroy

    user_post_counter = User.find_by(id: params[:id])
    user_post_counter.posts_counter -= 1
    user_post_counter.save

    redirect_to posts_path(id: params[:id])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:new_post).permit(:title, :content)
  end
end
