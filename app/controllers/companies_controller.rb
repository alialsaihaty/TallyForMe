class CompaniesController < ApplicationController
  def new
    @company = Company.new
    #@address = @company.addresses.new
    1.times{ @company.addresses.build }
    @phone = @company.phones.new
    @email = @company.emails.new
  end

  def create
    # render text: params
    @company = Company.new  company_params
    if @company.save
       redirect_to root_path, notice: "Compnay Created!"
    else
      flash[:alert] = "See errors below!"
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @company = Company.find params[:id]
    if @company.update
      redirect_to company_path, notice: "Compnay updated!"
    else
      flash[:alert] = "See errors below!"
      render :edit
    end
  end
  def show
  end

  def index
    @companies = Company.find company_params
  end

  private

  def company_params
    params.require(:company).permit(:name, :email, :user_id, phones_attributes: [:phone_number, :ext, :is_default, :phone_kind, :mobile, :id, :_destroy], addresses_attributes: [:address1, :city, :country, :zip, :id, :_destroy], emails_attributes: [:email, :is_default, :email_kind, :id, :_destroy] )
  end
end
