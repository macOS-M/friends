# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < ApplicationController
    layout 'admin'
  
    before_action :authenticate_user!
    before_action :authenticate_admin!
  
    def index
        @total_friends = Friend.count 
        @last_friend_date = Friend.order(created_at: :desc).first&.created_at
    end
  
    private
  
    def authenticate_admin!
      redirect_to root_path unless current_user&.admin?
    end
  end
  