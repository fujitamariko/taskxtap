class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:show]

    def show
        @user = User.find(params[:id])
        unless @user == current_user
          redirect_to tasks_path, notice: '他の人のページへアクセスは出来ません'
        end
    end

    private
    def set_user
      @user = User.find(params[:id])
    end
end
