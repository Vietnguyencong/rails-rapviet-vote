class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController # inherate from devise: omniauth controller 
    def facebook
        # creat the user 
        @user = User.from_omniauth(request.env["omniauth.auth"]) # ominiauth.auth : all the parameters (user's infor) that facebook sends back 
        # @user.save!
        if @user.persisted? # not save VALID  invalid 
            puts "USERS persisted"
            sign_in_and_redirect @user, :event => :authentication # if user created, authenticate the user
            set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
        else # if fail to sign in 
            # testing the valud 
            # puts "USERS NOT PERSISTED"
            # puts request.env["omniauth.auth"].uid
            # puts request.env["omniauth.auth"].info.name
            # puts request.env["omniauth.auth"].info.name
            # puts request.env["omniauth.auth"].info.email
            auth = request.env["omniauth.auth"]
            if (User.find_by(uid: auth.uid)) # nil = false != true
                puts "found"
                @new_user = User.find_by(uid: request.env["omniauth.auth"].uid)
            else 
                puts "creating user from scratch"
                @new_user = User.create!(name: auth.info.name, email: "#{request.env["omniauth.auth"].uid}@gmail.com" , uid: auth.uid, password: Devise.friendly_token[0,20])
                @new_user.save!
            end
            if @new_user.persisted?
                sign_in_and_redirect @new_user, :event => :authentication
                set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
            else 
                session["devise.facebook_data"] = request.env["omniauth.auth"]
                redirect_to user_session_path(@user)
            end
        
        end
    end
    
    def failure
        redirect_to root_path
    end
end