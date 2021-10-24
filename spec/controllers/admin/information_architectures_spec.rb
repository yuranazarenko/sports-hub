# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::InformationArchitecturesController, type: :request do
  let!(:admin_user) { create(:user, :admin) }
  sign_in_admin

  context "GET /admin/information_architectures" do
    it "properly validates route" do
      get admin_information_architectures_path, xhr: true
      expect(response).to have_http_status(:success)
    end
  end
end
