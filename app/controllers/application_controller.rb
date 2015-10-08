class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  # NON_COMPNAY_CONTROLLER = [
  #   SessionsController,
  #   CompaniesController,
  #   UsersController,
  #   HomeController
  # ]

    def check_for_current_company
      # return if NON_COMPNAY_CONTROLLER.include? self.class

      unless current_company
      flash[:alert] = "First create a Company"
      redirect_to new_company_path
    end
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    #same as @current_user = @current_user || User.find_by_id session[:user_id]
  end
  helper_method :current_user

  def current_company
    # c = Company.where(user_id: :user_id)
    #  User.find_by_id(1).company_id
    # User.find_by_id(current_user).company_id
    @current_company ||= current_user.company
    # Company.find_by(id: session[:company_id])
    #  unless @current_company
    #    Rails.logger.warn "No Company found"
    #    raise "No Company found for id: #{session[:company_id] || "none"}"
    #  end
    # @current_company
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
