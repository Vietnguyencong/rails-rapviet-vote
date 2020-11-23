class LuckyNumberMailer < ApplicationMailer
    def lucky_number_mail
        @user = params[:user]
        mail to: "vietdbm@gmail.com", subject:"Thank you for voting"
    end
end
