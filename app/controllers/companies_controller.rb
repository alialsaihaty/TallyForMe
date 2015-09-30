class CompaniesController < ApplicationController
  def new
    @company = Company.new
    #@address = @company.addresses.new
    1.times{ @company.addresses.build }
    @phone = @company.phones.new
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
    params.require(:company).permit(:name, :email, :user_id, :phone_number, addresses_attributes: [:address1, :city, :country, :zip, :id, :_destroy] )
  end
end
