class SessionsController < ApplicationController
    def new
        
    end

    
  
    def create   
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
          log_in(@user)
          current_user()
          params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
          redirect_to root_url
      else
        # Create an error message.
        flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
    end


    def destroy
        signout() if current_user() != nil
        redirect_to root_url
    end
end
