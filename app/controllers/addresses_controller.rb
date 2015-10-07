class AddressesController < ApplicationController

  before_action :find_addresable

  def new
    @address = Address.new
  end


  def create
    # @address.company = current_company
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
    client = Client.find params[:id]
    # @address = client.addresses.where(addressable_id: 6)
    @address = client.addresses.first
    @address_display = @address ? @address.display : ""
    # render json: { address_display }

    render json:{address: @address.display}
    #  render json: @address
    # render :show, layout: false
  end

  private

  def find_addresable
    if params[:company_id]
      @company = @addresable = Company.find params[:company_id]
    elsif params[:client_id]
      @client = @addresable = Client.find params[:client_id]
    end
  end

  def address_params
    params.require(:address).permit(:address1, :address2, :address3, :city, :state, :zip, :country)
  end
end
