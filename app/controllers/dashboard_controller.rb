class DashboardController < ApplicationController

  def index
    @company = current_company
  end

end
