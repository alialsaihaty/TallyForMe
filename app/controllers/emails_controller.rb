class EmailsController < ApplicationController


  def new
    @email = Email.new
    @company = @emailable = Company.find params[:company_id]
  end

  def create
    @company = @emailable = Company.find params[:company_id]
    # @email.user   = current_user
    # @user         = @email.user
    @email = Email.new email_params
    @email.emailable = @emailable
    @email.save
  end

  def edit
  end

  def index
  end

  def show
  end

  private

  def email_params
    params.require(:email).permit(:email, :is_default, :email_kind,)
  end
end
