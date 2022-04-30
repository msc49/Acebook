class LikesController < ApplicationController

  before_action :find_like, only: [:destroy]

  

  def create
    @post = Post.find(params[:post_id])
    already_liked? ? flash[:notice] = "You can't like more than once" : @post.likes.create(user_id: current_user.id)
    redirect_to posts_path(@post)
  end

  def destroy
    !(already_liked?) ? flash[:notice] = 'You cannot Unlike' : @like.destroy
    redirect_to posts_path(@post)

  end



  private 

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  def find_like
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])
  end


end
  

  