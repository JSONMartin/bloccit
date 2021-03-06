class Users::RegistrationsController < Devise::RegistrationsController

  def update

    # Required if submitting form without password
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    @user = User.find(current_user.id)

    if @user.update_attributes(params[:user])
      set_flash_message :notice, :updated
      # Sign in user bypassing validation in the case of password change
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "devise/registraitons/edit"
    end

  end
  
end