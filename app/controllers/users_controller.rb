class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # def show
  #   @user = User.find_by(id: params[:id])
  #   @posts = @user.retrieve_recent_posts
  #   respond_to do |format|
  #     format.html
  #     format.json do
  #       if current_user.id == params[:id].to_i
  #         render json: @user.posts
  #       else
  #         render html: "You don't have permission to see this page"
  #       end
  #     end
  #   end
  # end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User was successfully created'
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :bio, :posts_counter)
  end
end
