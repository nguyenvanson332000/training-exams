# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :logged_in_user, only: %i[index destroy]
    before_action :load_user, only: %i[destroy show]

    def index
      @users = User.all.paginate(page: params[:page], per_page: 7)
    end

    def show; end

    def destroy
      if @user.destroy
        flash[:success] = 'User deleted'
        redirect_to admin_users_url
      end
    end

    private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = 'Please log in.'
        redirect_to login_url
      end
    end

    def load_user
      @user = User.find_by(id: params[:id])
      return if @user.present?

      flash[:danger] = 'khong tim thay user'
      redirect_to root_url
    end
  end
end
