class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin_user!

  def authenticate_admin_user!
    redirect_to root_url unless current_user.admin?
  end
end
