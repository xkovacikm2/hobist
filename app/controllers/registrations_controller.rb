class RegistrationsController < Devise::RegistrationsController
  ###########
  private
  ###########

  #Override because of custom non-devise attributes
  def sign_up_params
    params.require(:user).permit  :email, :name, :password, :password_confirmation
  end

  #Override because of custom non-devise attributes
  def account_update_params
    params.require(:user).permit  :email, :name, :password, :password_confirmation, :current_password
  end
end
