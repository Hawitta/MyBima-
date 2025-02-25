class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user
  helper_method :current_admin # Ensures it works in all views/layouts


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
 

end
