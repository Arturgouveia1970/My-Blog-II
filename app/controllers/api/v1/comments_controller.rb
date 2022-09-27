class Api::V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @post = Post.find(params[:post_id])
    comment = @post.comments
    render json: comment
  end

  def new
    @comment = Comment.new
    render json: @comment
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to user_post_path(current_user, @post), notice: 'Comment created successfully' }

        format.json { render json: @comment, status: :created }
      end
    else
      respond_to do |format|
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :author_id, :post_id)
  end
end
