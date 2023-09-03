class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(likes_params)

    # WHY WHEN I ADD THE FOLLOWING LINE OF CODE, THE LIKING FUNCTIONALITY AIN'T WORK?
    # @post = Post.find(params[:post_id])

    if @like.save
      redirect_to @like.post
    else
      redirect_to posts_path, notice: "Something went wrong!"
    end
  end


  def destroy
    @like = current_user.likes.find(params[:id])
    @post = @like.post

    if @like.destroy
      redirect_to @post
    else
      redirect_to @post, notice: "Something went wrong!"
    end
  end



  private

  def likes_params
    params.require(:like).permit(:post_id)
  end
end
