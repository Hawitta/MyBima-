# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  layout 'login', only: [:new]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super do |resource|
      return redirect_to admin_dashboard_path if resource.admin?
  end

end
end
