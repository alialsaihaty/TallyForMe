class ClientsController < ApplicationController

  def new
    @client = Client.new
    @address = @client.addresses.new
    @phone   = @client.phones.new
    @email   = @client.emails.new
  end

  def create
    @client         = Client.new client_params
    @client.company = current_company
    @company         = @client.company
    if @client.save
      redirect_to root_path, notice: "Client Added!"
    else
      flash[:alert] = "See errors below!"
      render :new
    end
  end

  def show
    @client = Client.find params[:id]
  end

  def index
    @clients = Client.all
  end

  def edit
    @clien = Client.find params[:id]
  end

  def update
    @clien = Client.find params[:id]
    if @client.update client_params
      redirect_to @client, notice: "Client Updated"
    else
      flash[:alert] = "See errors below!"
      render :edit
    end
  end

  def destroy
    @clien = Client.find params[:id]
    @client.destroy
    redirect_to clients_path, notice: "Client was successfully destroyed"
  end

  private

  def client_params
    params.require(:client).permit(:business_name, :client_name, :company_id,
                                   addresses_attributes: [:address1, :city, :state, :country, :zip],
                                   emails_attributes: [:email],
                                   phones_attributes: [:phone_number, :ext])
  end


end
