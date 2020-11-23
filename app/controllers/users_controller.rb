class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def generate_lucky_number(user_id)
        user = User.where(id: user_id)
        user.lucky_number = rand(1..10000)
        user.add_lucky_number = true
        user.save
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