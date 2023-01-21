class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters , if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up , keys: [:user_type])
        devise_parameter_sanitizer.permit(:sign_up  , keys: [:name])

        devise_parameter_sanitizer.permit(:account_update , keys: [:user_type])
        devise_parameter_sanitizer.permit(:account_update  , keys: [:name])
    end

rescue_from CanCan::AccessDenied do |exception|
    redirect_to error_url :alert =>exception.message
end

end
