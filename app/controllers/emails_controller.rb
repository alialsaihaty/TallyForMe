class EmailsController < ApplicationController

  before_action :find_emailable

  def new
    @email = Email.new
  end

  def create
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

  def find_emailable
    if params[:company_id]
      @company = @emailable = Company.find params[:company_id]
    elsif params[:client_id]
      @client = @emailable = Client.find params[:client_id]
    end
  end

  def email_params
    params.require(:email).permit(:email, :is_default, :email_kind,)
  end
end
