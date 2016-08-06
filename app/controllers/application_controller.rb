class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   def logged_in_user
    # @current_user ||= User.find(session[:user]) if session[:user]
    @current_user ||= find_user
  end

  helper_method :logged_in_user

  protected

    def authorize
      redirect_to login_path unless logged_in_user
    end

    def find_user
      if session[:user]
        User.find(session[:user])
      elsif cookies[:user]
        User.find(cookies[:user])
      end
    end

    helper_method :current_user 
    def current_user 
      @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end

    helper_method :admin? 
    def admin? 
      @user = current_user
      if @user.role == 'admin'
        true
      end
    end

    def require_user 
      redirect_to '/login' unless current_user 
    end

    def require_admin 
      redirect_to '/' unless current_user.admin? 
    end
 
end
