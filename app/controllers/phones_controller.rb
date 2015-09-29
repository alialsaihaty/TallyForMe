class PhonesController < ApplicationController
  def new
    @phone = Phone.new
  end
  def create
    @phone          = Phone.new phone_params
    @phone.phonable = @phonable
    @phone.save
  end
  def edit
  end

  def index
  end
end
