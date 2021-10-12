# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    include Pundit
    include Pagy::Backend
    before_action :authenticate_user!
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def index
      authorize %i[admin base]
      @pagy_admin_users, @admin_users = pagy(User.admin_users,
                                             page_param: :admin_users,
                                             params:     { active_tab: "admin_users" })
      @pagy_simple_users, @simple_users = pagy(User.simple_users,
                                               page_param: :simple_users,
                                               params:     { active_tab: "simple_users" })
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
