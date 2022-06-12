class ApplicationController < ActionController::Base
  protect_from_forgery
  # check_authorization unless: :devise_controller?
  
  def current_ability
    if current_admin
      @current_ability = AdminAbility.new(current_admin)
    elsif current_doctor
      @current_ability = DoctorAbility.new(current_doctor)
    else
      @current_ability = UserAbility.new(current_user)
    end
  end
end
