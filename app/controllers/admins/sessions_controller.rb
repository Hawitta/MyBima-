# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  layout 'login', only: [:new]
  # before_action :configure_sign_in_params, only: [:create]

  def create
    super do |resource|
      return redirect_to admins_dashboard_path 
  end

  def destroy
    sign_out(current_admin)  # Ensure the admin is signed out
    redirect_to root_path, notice: "Signed out successfully."  # Redirect to home page or login page
  end
end
end
