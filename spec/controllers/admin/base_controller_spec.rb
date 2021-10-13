# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::BaseController, type: :request, aggregate_failures: true do
  context "GET /admin" do
    let!(:user) { create(:user) }
    let!(:admin_user) { create(:user, admin: true) }

    context "user is admin" do
      sign_in_admin

      it "properly validates route" do
        get admin_main_page_path, xhr: true
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not admin" do
      sign_in_user

      it "properly validates route" do
        get admin_main_page_path, xhr: true
        expect(response).to have_http_status(302)
      end
    end

    context "user is not logged in" do
      it "properly validates route" do
        get admin_main_page_path, xhr: true
        expect(response).to have_http_status(302)
      end
    end

    context "validates local variables" do
      sign_in_admin

      it "properly validates admin_users & simple_users" do
        get admin_main_page_path, xhr: true
        expect(assigns(:admin_users)).to match_array([admin_user])
        expect(assigns(:simple_users)).to match_array([user])
      end
    end
  end
end
