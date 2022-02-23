class RegistrationsController < ApplicationController
    def signup
        @user = User.new(registrations_params)
        if @user.save
            login!
            render josn:{status: :os, user:@user}
        else
            render json: {status: 500}
        end
    end
    private
        def registrations_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end
end