class LuckyNumberMailer < ApplicationMailer
    def lucky_number_mail
        @user = params[:user]
        mail to: @user.email, subject:"Thank you for voting"
    end
end
