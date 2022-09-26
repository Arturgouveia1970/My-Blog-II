class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.create
    @like.user = current_user
    @like.post = @post

    if @like.save
      flash[:success] = 'Like Added successfully'
      redirect_to user_post_path(current_user, @post)
    else
      flash.now[:error] = 'Error: Like could not be saved'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @post = Post.find
    @post.likes_counter -= 1
    @post.save
    @like.destroy!
    flash[:success] = 'You have disliked the post!!.'
    redirect_to user_post_path(current_user, params[:post_id])
  end
end
