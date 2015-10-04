class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  def create
    @client = Client.new client_params
    if @client.save
      redirect_to 
    else
      flash[:alert] = "See errors below!"
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name)
  end
end
