# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < ApplicationController
    layout 'admin'
  
    before_action :authenticate_user!
    before_action :authenticate_admin!
  
    def index

       
    end
    def graph
      @friends_by_day = Friend.group_by_day_of_week(:created_at, format: "%a").count
      @total_friends = Friend.count 
      @last_friend_date = Friend.order(created_at: :desc).first&.created_at
    end
  
    private
  
    def authenticate_admin!
      redirect_to root_path unless current_user&.admin?
    end
  end
  