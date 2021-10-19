class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:show, :destroy]

    def show
        unless @user == current_user
          redirect_to tasks_path, notice: '他の人のページへアクセスは出来ません'
        end
    end

    # def edit
    # end

    # def update
    #   if @user.update(user_params)
    #     redirect_to tasks_path, notice: "ユーザー情報を編集しました！"
    #   else
    #     render :edit
    #   end
    # end

    def destroy
      @user.destroy
      redirect_to new_user_registration_path, notice:"ユーザーを削除しました"
    end

    private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
