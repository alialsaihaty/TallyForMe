class AddressesController < ApplicationController


  def new
    @address = Address.new
    @company = @addresable = Company.find params[:company_id]
  end


  def create
    @company = @addresable = Company.find params[:company_id]
    @address               = Address.new address_params
    @address.addresable    = @addresable
    @address.company       = @company
    @address.save
  end
  def index

  end

  def edit

  end

  def show

  end

  private

  def address_params
    params.require(:address).permit(:address1, :address2, :address3, :city, :state, :zip, :country)
  end
end
