class LikesController < ApplicationController

  def create
    @like = current_user.likes.new(likes_params)

    # WHY WHEN I ADD THE FOLLOWING LINE OF CODE, THE LIKING FUNCTIONALITY AIN'T WORK?
    # @post = Post.find(params[:post_id])

    if @like.save
      redirect_to @like
    else
      redirect_to root_path, notice: "Something went wrong!"
    end
  end


  def destroy
    @like = current_user.likes.find(params[:id])
    likeable = @like.likeable

    if @like.destroy
      redirect_back(fallback_location: posts_url)
    else
      redirect_to root_path, notice: "Something went wrong!"
    end
  end



  private

  def likes_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
