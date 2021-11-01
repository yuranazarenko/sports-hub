# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::InformationArchitectures::SubCategoriesController, type: :request, aggregate_failures: true do
  let!(:admin_user) { create(:user, :admin) }
  let!(:category) { create(:category) }
  sign_in_admin

  context "POST " do
    context "valid saving process" do
      it "saves the new sub category" do
        expect do
          post admin_information_architectures_sub_categories_path,
               xhr:    true,
               params: FactoryBot.attributes_for(:sub_category, category_id: category.id)
        end.to change { SubCategory.count }.by(1)
        expect(response.status).to eq 200
        expect(flash[:note]).to eq "Sub category saved"
      end
    end

    context "invalid saving process" do
      it "doesn't save the new sub category (too short name)" do
        expect do
          post admin_information_architectures_sub_categories_path,
               xhr:    true,
               params: { name: "A", category_id: category.id }
        end.to change { SubCategory.count }.by(0)
        expect(flash[:note]).to eq "Could not save sub category"
      end
    end
  end
end
