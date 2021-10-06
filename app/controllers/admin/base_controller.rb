# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    include Pundit
    before_action :authenticate_user!
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def index
      authorize %i[admin base]
    end

    private

    def user_not_authorized
      redirect_to home_path
    end

    def authenticate_user!
      redirect_to user_session_path unless user_signed_in?
    end
  end
end
