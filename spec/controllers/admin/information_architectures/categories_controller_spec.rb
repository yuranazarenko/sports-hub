# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::InformationArchitectures::CategoriesController, type: :request, aggregate_failures: true do
  let!(:admin_user) { create(:user, :admin) }
  sign_in_admin

  context "POST " do
    context "valid saving process" do
      it "saves the new category" do
        expect do
          post admin_information_architectures_categories_path, xhr: true, params: FactoryBot.attributes_for(:category)
        end.to change { Category.count }.by(1)
        expect(response.status).to eq 200
        expect(flash[:note]).to eq "Category saved"
      end
    end

    context "invalid saving process" do
      it "doesn't save the new category (too short name)" do
        expect do
          post admin_information_architectures_categories_path,
               xhr:    true,
               params: { name: "A" }
        end.to change { Category.count }.by(0)
        expect(flash[:note]).to eq "Could not save category"
      end
    end
  end
end
