# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::SessionsController, type: :request, aggregate_failures: true do
  let!(:user) { create(:user) }
  context "GET /users/sign_in" do
    it "properly validates route" do
      get new_user_session_path, xhr: true
      expect(response.status).to eq 200
    end
  end

  context "POST /users/sign_in" do
    sign_in_user

    it "properly validates route" do
      post user_session_path, xhr: true
      expect(controller.current_user).to eq user
      expect(response.status).to eq 200
    end
  end

  context "DELETE /users/sign_out" do
    sign_in_user

    it "properly validates route" do
      post user_session_path, xhr: true
      expect(controller.current_user).to eq user
      delete destroy_user_session_path, xhr: true
      expect(controller.current_user).to eq nil
      expect(response.status).to eq 200
    end
  end
end
