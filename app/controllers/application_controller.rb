class ApplicationController < ActionController::Base

  before_action :authenticate_user!, if: :admin_not_login

  def admin_not_login
    !current_admin.present?
  end

  def after_sign_in_path_for(resource)
    if current_user
      root_path
    else
      rails_admin.dashboard_path
    end
  end
end
