class ApplicationController < ActionController::Base
    before_action :redirect_admin, if: :user_signed_in?

    private
  
    def redirect_admin
        if current_user.admin? && request.path == authenticated_root_path
          redirect_to admin_dashboard_path
        end
      end
    
      def after_sign_in_path_for(resource)
        if resource.admin?
          admin_dashboard_path
        else
          authenticated_root_path
        end
      end
    end