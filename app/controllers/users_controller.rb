class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit([:first_name, :last_name, :email, :password, :password_confirmation])
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "You have Sccussfully created an account!"
    else
      flash[:alert] = "Your account is not created!"
      render :new
    end
  end


end
