class Users::PasswordsController < Devise::PasswordsController
  protected
    def after_resetting_password_path_for(resource)
      user_path(resource.id)
    end
end
