class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  helper_method :current_user

   def current_user
  	 current_user ||= Admin.find_by(id: session[:user_id]) if session[:user_id]
   end

   def require_user
  	 redirect_to login_path unless current_user.present?
   end
end
