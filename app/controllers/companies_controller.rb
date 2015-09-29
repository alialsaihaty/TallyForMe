class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new company_params
    if @company.save
      redirect_to companies_path, notice: "Company created!"
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
    params.require(:company).permit(:name, :email, :user_id, )
  end
end
