class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'admin'
  
  def authenticate_auth
    authenticate_user!
    if current_user.id != 1
      redirect_to(root_path, notice: '没有权限！') and return
    end
  end

end
