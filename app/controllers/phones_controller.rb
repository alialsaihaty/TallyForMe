class PhonesController < ApplicationController

  before_action :find_phonable

  def new
    @phone = Phone.new
  end

  def create
    @phone               = Phone.new phone_params
    @phone.phonable = @phonable
    @phone.save
  end
  def edit
  end

  def index
  end

  private

  def find_phonable
    if params[:company_id]
      @company = @phonable = Company.find params[:company_id]
    elsif params[:client_id]
      @client = @phonable = Client.find params[:client_id]
    end
  end

  def phone_params
    params.require(:phone).permit(:phone_number, :ext, :is_default, :mobile)
  end
end
