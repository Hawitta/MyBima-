class Admins::DashboardController < Devise::DashboardController
    before_action :authenticate_admin!

    layout 'admin'
    
    def show
        @admin = current_admin 
        redirect_to admins_dashboard_path
      end
      
end