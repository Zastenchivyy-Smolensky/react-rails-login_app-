class SessionsController < ApplicationController
    def login
        @user = User.find_by(email: session_params[:email])
        if @user && user.authenticate(sessions_params[:password])
            login!
            render json: {logged_in: true, user: @user}
        else
            render json: {status: 401, errors: ["認証に失敗したました", "正しいメールアドレスをお願いします"]}
        end
    end

    def logout
        reset_session
        render json: {status: 200, logged_in: true}
    end

    def logged_in?
        if @current_user
            render json: {logged_in: true, user: current_user}
        else
            render json: {logged_in: false, message:"ユーザーが存在しません"}
        end
    end

    private
        def session_params
            params.require(:user).permit(:username, :email, :passwordz)
        end
end