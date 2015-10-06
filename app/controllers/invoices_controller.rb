class InvoicesController < ApplicationController

  before_action :authenticate_user!


  def new
    @invoice = Invoice.new
    @clients = Client.all
    @items   = Item.all
  end

  def create
    @invoice         = Invoice.new invoice_params
    @invoice.company = current_company
    @company         = @invoice.company
    if @invoice.save
      redirect_to @invoice, notice: "Invoice Created!"
    else
      flash[:alert] = "Invoice failed to create!"
      render :new
    end
  end

  def index
    @invoices = Invoice.all
  end

  def edit
    @invoice = Invoice.find params[:id]
  end

  def update
    @invoice = Invoice.find params[:id]
    if @invoice.update invoice_params
      redirect_to @invoice, notice: "Invoice was successfully updated!"
    else
      flash[:alert] = "See errors below!"
      render :edit
    end
  end

  def show
    @invoice = Invoice.find params[:id]
  end


  private

  def invoice_params
    params.require(:invoice).permit(:invoice_number, :invoice_date, :subtotal,
                                    :tax1, :tax2, :is_paid, :payment_kind,
                                    :payment_date, :company_id)
  end
end
