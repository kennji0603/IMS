class Dashboard::UsersController < ApplicationController
  before_action :authenticate_user!
  layout  "dashboard/dashboard"

  def index
    @users = User.where(admin: 0)
  end

end
