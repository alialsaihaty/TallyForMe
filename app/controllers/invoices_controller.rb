class InvoicesController < ApplicationController

  before_action :authenticate_user!


  def new
    # @user = current_user
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new invoice_params
    @invoice.user = current_user
    if @invoice.save
      redirect_to invoices_path, notice: "Invoice Created!"
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
    @invoice = @user.invoice

    if @invoice.user_id != current_user_id
      redirect_to 
    end
  end

  def update

  end

  def show
  end



  private

  def invoice_params
    params.require(:invoice).permit(:invoice_number, :invoice_date, :subtotal,
                                    :tax1, :tax2, :is_paid, :payment_kind,
                                    :payment_date, :company_id)
  end
end
