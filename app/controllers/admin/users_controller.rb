# frozen_string_literal: true

module Admin
  class UsersController < BaseController
    def index
      authorize %i[admin base]
      @pagy_admin_users, @admin_users = pagy(
        User.admin_users,
        page_param: :admin_users,
        params:     { active_tab: "admin_users" }
      )
      @pagy_simple_users, @simple_users = pagy(
        User.simple_users,
        page_param: :simple_users,
        params:     { active_tab: "simple_users" }
      )
    end
  end
end
