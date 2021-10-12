# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::BaseController, type: :request do
  context "GET /admin" do
    let(:simple_user) { create(:user) }
    let(:admin_user) { create(:user, admin: true) }

    context "user is admin" do
      it "properly validates route" do
        # log in as admin
        post user_session_path, xhr: true, params: { user: { email: admin_user.email, password: admin_user.password } }
        get admin_main_page_path, xhr: true
        expect(response).to have_http_status(:success)
      end
    end

    context "user is not admin" do
      it "properly validates route" do
        # log in as not admin
        post user_session_path, xhr: true, params: { user: { email: simple_user.email, password: simple_user.password } }
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
      let(:simple_user) { create(:user) }
      let(:admin_user) { create(:user, admin: true, email: "enother_email@gmail.com") }

      it "properly validates admin_users" do
        # log in as admin
        post user_session_path, xhr: true, params: { user: { email: admin_user.email, password: admin_user.password } }
        get admin_main_page_path, xhr: true
        expect(assigns(:admin_users)).to include(admin_user)
      end

      it "properly validates simple_users" do
        # log in as admin
        post user_session_path, xhr: true, params: { user: { email: admin_user.email, password: admin_user.password } }
        get admin_main_page_path, xhr: true, params: { simple_user: simple_user, admin_user: admin_user }
        expect(assigns(:simple_users)).to include(simple_user)
      end
    end
  end
end
