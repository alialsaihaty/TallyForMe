class PhonesController < ApplicationController
  def new
    @phone = Phone.new
    @company = @phonable = Company.find params[:company_id]
  end

  def create
    @company = @phonable = Company.find params[:company_id]
    @phone               = Phone.new phone_params
    @phone.phonable = @phonable
    @phone.save
  end
  def edit
  end

  def index
  end

  private

  def phone_params
    params.require(:phone).permit(:phone_number, :ext, :is_default, :mobile)
  end
end
