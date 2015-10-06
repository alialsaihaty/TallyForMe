class DashboardsController < ApplicationController
  def index
    @company = Company.new
    @invoice = Invoice.new
    @client  = Client.new
    @product = Product.new
    @service = Service.new
  end
end
