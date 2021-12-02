# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::InformationArchitectures::CategoriesController, type: :request, aggregate_failures: true do
  let!(:admin_user) { create(:user, :admin) }
  sign_in_admin

  context "POST /admin/information_architectures/categories" do
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

  context "DELETE /admin/information_architectures/sub_categories" do
    let!(:category) { create(:category) }

    context "valid remove process" do
      it "remove the category" do
        expect(Category.count).to eq 1
        expect do
          delete "/admin/information_architectures/categories/#{category.id}", xhr: true
        end.to change { Category.count }.by(-1)
        expect(flash[:note]).to eq "Category deleted"
      end
    end

    context "invalid remove process" do
      it "doesn't remove category (Category not found)" do
        expect do
          delete "/admin/information_architectures/categories/0", xhr: true
        end.to change { Category.count }.by(0)
        expect(flash[:note]).to eq "Category not found"
      end
    end
  end

  context "PATCH /admin/information_architectures/categories/:id" do
    let!(:category) { create(:category) }

    context "valid remove process" do
      it "update the category" do
        patch admin_information_architectures_category_path(category.id), params: { name: "new_name" }
        expect(Category.find(category.id).name).to eq "new_name"
        expect(flash[:note]).to eq "Category updated"
      end
    end
  end
end
