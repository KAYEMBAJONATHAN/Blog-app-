class LikesController < ActionController::Base
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      render 'posts/show'
    end
  end

  def create
    @like = Like.new(like_params)
    @like.save
    redirect_to likes_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to likes_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
