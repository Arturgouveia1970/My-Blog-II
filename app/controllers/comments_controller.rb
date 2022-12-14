class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.update_comments_counter
    if @comment.save
      redirect_to user_post_path(current_user, @post.id)
    else
      flash.now[:error] = 'Error: Comment can not be saved. Please try again.'
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(@comment.post_id)
    @comment.destroy!
    respond_to do |format|
      format.html do
        if @comment.destroy
          @post.decrement!(:comments_counter)
          flash[:success] = 'Comment was successfully deleted.'
          redirect_to user_post_path(current_user, @comment.post.id)
        else
          flash.now[:error] = 'Comment was not deleted.'
          flash.show
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
