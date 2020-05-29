class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Your account was successfully created"
      redirect_to chat_path
    else
      flash.now[:error] = @user.errors.full_messages
      render 'new'
    end
  end

private

def user_params
  params.require(:user).permit(:username, :password)
end

end
