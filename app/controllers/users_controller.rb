class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy, :generate_lucky_number]

    def generate_lucky_number
        @user.lucky_number = rand(1..10000)
        @user.add_lucky_number = true
        @user.save
        # send the email right here
        LuckyNumberMailer.with(user: @user).lucky_number_mail.deliver_now
        redirect_to(root_path)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:id, :lucky_number, :add_lucky_number)
    end
end