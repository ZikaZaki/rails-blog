class CommentsController < ApplicationController
  def new
    @new_comment = Comment.new
  end

  def create
    @comment = Comment.new(post_params)
    @comment.author = current_user
    current_post = Post.find_by(id: params[:post_id])
    p current_post
    @comment.post = current_post
    if @comment.save
      current_post.comments_counter += 1
      current_post.save
      redirect_to "/users/#{current_user.id}/posts/#{params[:post_id]}"
    else
      render :new
    end
  end

  def destroy
    current_comment = Comment.find_by(id: params[:comment_id])
    authorize! :destroy, current_comment
    current_comment.destroy
    current_comments_counter = Post.find_by(id: params[:post_id]).comments_counter
    current_comments_counter.comments_counter -= 1
    current_comments_counter.save
    redirect_to user_post_path(id: params[:id], post_id: params[:post_id])
  end

  private

  def post_params
    params.require(:new_comment).permit(:content)
  end
end
