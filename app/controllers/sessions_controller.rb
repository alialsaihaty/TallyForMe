class SessionsController < ApplicationController


  def new
  end

  def create
    @user = User.find_by_email params[:email]
    @company = Company.find_by_id params[:id]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:company_id] = @user.company_id
      redirect_to root_path, notice: "Signed in successfully!"
    else
      flash[:alert] = "Wrong credentials"
      redirect_to :new
    end
  end

  def destroy
    session[:user_id]    = nil
    session[:company_id] = nil
    redirect_to root_path, notice: "Sign out successfully!"
  end
end
