class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    if  current_user.try(:admin?)
       dashboard_path
    else
        root_path
    end
  end

    def after_sign_out_path_for(resource)
        new_user_session_path
    end
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :phone_number])
  end
end
