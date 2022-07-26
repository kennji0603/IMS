class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard/dashboard'
  def index
    
  end
end
