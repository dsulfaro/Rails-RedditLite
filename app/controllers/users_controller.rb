class UsersController < ApplicationController

  def new
    user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      render "shared/temp" ### CHANGE THIS
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    if current_user && current_user.id == params[:id].to_i
      render :show
    else
      redirect_to new_session_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
