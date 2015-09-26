class AddressesController < ApplicationController

  before_action :find_addressable

  def new
  end


  def create
    @address            = Address.new address_params
    @address.addresable = @addresable
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
