class CompaniesController < ApplicationController
  
  def new
    @user = current_user
    @company = Company.new
    # @address = Address.new
    # @phone   = Phone.new
    # @email   = Email.new
    # 2.times{ @company.addresses.build }
    @address = @company.addresses.new
    @phone   = @company.phones.new
    @email   = @company.emails.new
  end

  def create
    @company      = Company.new  company_params
    @company.user = current_user
    @user         = @company.user
    if @company.save
       redirect_to root_path, notice: "Compnay Created!"
    else
      flash[:alert] = "See errors below!"
      render :new
    end
  end

  def edit
    @company = Company.find params[:id]
    # @user = current_user
    # @company = @user.compnay
    # if @compnay.user_id != current_user.id
    #   redirect_to compnay_path(@compnay)
    # end
  end

  def update
    @company = Company.find params[:id]
    if @company.update company_params
      redirect_to company_path, notice: "Compnay updated!"
    else
      flash[:alert] = "See errors below!"
      render :edit
    end
  end
  def show
    @company = Company.find params[:id]
  end

  def index
    @companies = Company.find company_params
  end

  private

  def company_params
    params.require(:company).permit(:name, :email,
                                    addresses_attributes: [:address1, :city, :state, :country, :zip],
                                    phones_attributes: [:phone_number, :ext],
                                    emails_attributes: [:email])
  end
end
