 class LikesController < ApplicationController
  before_action :find_post

    def create
      @like = @post.likes.build(user_id: current_user.id)
  
      if @like.save
        redirect_to @post, notice: 'Post liked!'
      else
        redirect_to @post, alert: 'Unable to like the post.'
      end
    end
  
    def destroy
      like = @post.likes.find_by(user_id: current_user.id)
      like.destroy if like
      redirect_to @post, notice: 'Post unliked!'
    end
  
    private

    def find_post
      @post = Post.find(params[:post_id])
    end
  end
