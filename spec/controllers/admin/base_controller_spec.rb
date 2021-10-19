# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::BaseController, type: :request, aggregate_failures: true do
  context "GET /admin" do
    let!(:user) { create(:user) }
    let!(:admin_user) { create(:user, :admin) }

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
  end
end
