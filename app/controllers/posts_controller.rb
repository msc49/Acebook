class PostsController < ApplicationController
  # def new
  #   @post = Post.new
  # end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_url

    if @post.image.attached? == false && @post.message == ""
      flash[:alert] = "Post needs a message or an image."
    else
      flash[:notice] = "You have successfully created a post."
    end

  end

  def index
    @friendships = Friendship.all
    @user = current_user

    @pagy, @posts = pagy(Post.order(created_at: :desc), items:10)
    @post = Post.new 

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_url
      flash[:notice] = "You have successfully edited a post."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url, status: :see_other #this will need to change to post_path. how to delete a post that has comments?
    flash[:notice] = "You have successfully deleted a post."
  end
  
  private

  def post_params
    params.require(:post).permit(:message, :image)
  end

end
