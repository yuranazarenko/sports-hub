# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :request do
  context "GET /users/sign_up" do
    it "properly validates route" do
      get new_user_registration_path, xhr: true
      expect(response.status).to eq 200
    end
  end

  context "POST /users" do
    let(:user) { build(:user) }

    it "properly validates route" do
      expect do
        post user_registration_path, xhr: true, params: { user: FactoryBot.attributes_for(:user) }
      end.to change { User.count }.by(1)
      expect(response.status).to eq 200
    end
  end
end
