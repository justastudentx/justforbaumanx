class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  def require_login
    unless @user = User.find_by_session_id(session[:session_id])
      puts "Пользователь не прошел аутентификацию"
      redirect_to "/login"
      return
    end
  end
end
