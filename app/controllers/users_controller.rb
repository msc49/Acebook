class UsersController < ApplicationController
  def index
    @pagy, @users = pagy(User.order(username: :asc), items: 5)
  end

  def search
   @users = User.where("username LIKE ?", "%" + params[:q] + "%")
  end
end
