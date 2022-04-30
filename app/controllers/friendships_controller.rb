class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Sent friend request."
      redirect_to users_url 
    else
      flash[:notice] = "Unable to send friend request."
      redirect_to users_url 
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(:accepted => true)
    redirect_to posts_url
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friend."
    redirect_to posts_url 
  end
end
