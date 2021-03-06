class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have Logged in!"
    else
      flash[:alert] = "Wrong Email or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You Have Logged Out!"
  end


end
