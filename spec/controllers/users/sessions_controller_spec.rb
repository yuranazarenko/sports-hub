# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::SessionsController, type: :request do
  context "GET /users/sign_in" do
    it "properly validates route" do
      get new_user_session_path, xhr: true
      expect(response.status).to eq 200
    end
  end

  context "POST /users/sign_in" do
    let(:user) { create(:user) }

    it "properly validates route" do
      post user_session_path, xhr: true, params: { user: { email: user.email, password: user.password } }
      expect(controller.current_user).to eq user
      expect(response.status).to eq 200
    end
  end

  context "DELETE /users/sign_out" do
    let(:user) { create(:user) }

    it "properly validates route" do
      post user_session_path, xhr: true, params: { user: { email: user.email, password: user.password } }
      expect(controller.current_user).to eq user
      delete destroy_user_session_path, xhr: true
      expect(controller.current_user).to eq nil
      expect(response.status).to eq 200
    end
  end
end
