# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    layout "authentication"

    def create
      @user = User.new(user_params.merge!({ admin: false }))

      if @user.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end
  end
end
