class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= User.find_by_id session[:user_id]
    #same as @current_user = @current_user || User.find_by_id session[:user_id]
  end
  helper_method :current_user

  def current_company
    # c = Company.where(user_id: :user_id)
    #  User.find_by_id(1).company_id
    # User.find_by_id(current_user).company_id
    @current_company ||= Company.find_by_id session[:company_id]
    # @current_company = @current_company || Company.find_by_id params[:id]
  end
  helper_method :current_company

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def authenticate_user!
    redirect_to new_session_path, alert: "Please sign in" unless user_signed_in?
  end

end
