class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController # inherate from devise: omniauth controller 
    def facebook
        # creat the user 
        @user = User.from_omniauth(request.env["omniauth.auth"]) # ominiauth.auth : all the parameters (user's infor) that facebook sends back 
    
        if @user.persisted?
            sign_in_and_redirect @user, :event => :authentication # if user created, authenticate the user
            set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
        else # if fail to sign in 
            session["devise.facebook_data"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
    end
    
    def failure
        redirect_to root_path
    end
end