class ApplicationController < ActionController::Base
    before_action :require_login
    helper_method :current_user
    helper_method :logged_in?
    helper_method :require_login
    
    def home
    end


  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
     end

    def logged_in?
        !!session[:user_id]
    end

    def require_login
      if !session[:user_id]
        flash[:login_required] = "Log in required."
        redirect_to root
      end
    end
end
