class ApplicationController < ActionController::Base
    def remember(user)
        User.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def log_in(user)
        session[:user_id] = user.id
        #current_user=(session[:user_id])
    end


    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def current_user?(user)
        user == current_user()
    end



    def current_user
        if (user_id = session[:user_id]) #its really an equal sign
          @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
          #raise       # The tests still pass, so this branch is currently untested.
          user = User.find_by(id: user_id)
          if user && user.authenticated?(:remember, cookies[:remember_token])
            log_in(user)
            @current_user = user
          end
        end
    end
    
    def current_user=(user)
        @current_user = user
    end

    def signout
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    helper_method :current_user
end
