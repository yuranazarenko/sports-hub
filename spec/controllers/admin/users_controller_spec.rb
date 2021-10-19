# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::UsersController, type: :request, aggregate_failures: true do
  context "GET /admin/users" do
    let!(:user) { create(:user) }
    let!(:admin_user) { create(:user, :admin) }

    context "validates local variables" do
      sign_in_admin

      it "properly validates admin_users & simple_users" do
        get admin_users_path, xhr: true
        expect(assigns(:admin_users)).to match_array([admin_user])
        expect(assigns(:simple_users)).to match_array([user])
      end
    end
  end
end
