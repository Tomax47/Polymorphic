class CommentsController < ApplicationController

  before_action :correct_user, only: [:destroy]

  def index
    @comment = Comment.all.order("created_at DESC ")
  end

  def new

  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to post_comments_path, notice: "Comment has been added!"
    else
      redirect_to post_comments_path, notice: "Can't add the comment!"
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.destroy
      redirect_to post_comments_path, notice: "Comment has been deleted!"
    else
      redirect_to post_comments_path, notice: "Can't delete the comment!"
    end
  end

  private

  def correct_user
    @comment = current_user.comments.find(params[:id])
    redirect_to post_comments_path, notice: "Unauthorized to delete this comment" if @comment.nil?
  end

  def comment_params
    params.require(:comment).permit(:content).merge(post_id: params[:post_id])
  end
end
