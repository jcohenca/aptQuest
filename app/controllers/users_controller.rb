class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])

    if @user != current_user
    redirect_to :root
    end
  end
end


