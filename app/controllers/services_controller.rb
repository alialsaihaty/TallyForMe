class ServicesController < ApplicationController
  def new
    @service = Service.new
  end

  def create
    @service         = Service.new service_params
    @service.company = current_company
    @company         = @service.company
    if @service.save
      redirect_to @service, notice: "Service Created!"
    else
      flash[:alert] = "See errors below!"
      render :new
    end
  end

  def index
    @services = Service.all
  end

  def edit
    @service = Service.find params[:id]
  end

  def update
    @service = Service.find params[:id]
    if @service.update service_params
      redirect_to @service, notice: "Service updated!"
    else
      flash[:alert] = "See errors below!"
      render :edit
    end
  end

  def show
    @service = Service.find params[:id]
  end

  def destroy
    @service = Service.find params[:id]
    @service.destroy
    redirect_to services_path, notice: "Service was successfully destroyed"
  end


  private

  def service_params
    params.require(:service).permit(:name, :unit, :tax1, :tax2, :description, :cost, :company_id)
  end

end
