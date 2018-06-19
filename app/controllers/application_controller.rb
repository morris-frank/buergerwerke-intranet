class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :redirect_url

    def redirect_url
      return new_user_session_path unless user_signed_in?
      case current_user
        when Member
          root_path
        when Admin
          root_path
      end
    end

  end
