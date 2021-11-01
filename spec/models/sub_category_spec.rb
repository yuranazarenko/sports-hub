# frozen_string_literal: true

require "rails_helper"

RSpec.describe SubCategory, type: :model, aggregate_failures: true do
  context "sub category attrs validation" do
    let!(:category) { create(:category) }
    let(:sub_category) { build(:sub_category, category_id: category.id) }

    it "accepts valid params" do
      expect(sub_category.valid?).to be_truthy
    end

    context "invalid params" do
      context "invalid name" do
        context "too short name" do
          let(:sub_category) { build(:sub_category, category_id: category.id, name: "a") }

          it "properly validates params" do
            expect(sub_category.valid?).to be_falsey
            expect(sub_category.errors.messages[:name]).to eq ["is too short (minimum is 2 characters)"]
          end
        end

        context "too long name" do
          let(:sub_category) { build(:sub_category, category_id: category.id, name: "qwertyuiopasdfghjklzx") }

          it "properly validates params" do
            expect(sub_category.valid?).to be_falsey
            expect(sub_category.errors.messages[:name]).to eq ["is too long (maximum is 20 characters)"]
          end
        end

        context "not unique name for one category" do
          let(:sub_category) { create(:sub_category, category_id: category.id, name: "ab") }
          let(:duplicate) { build(:sub_category, category_id: category.id, name: "ab") }
          it "properly validates error (duplicate name)" do
            expect(sub_category.valid?).to be_truthy
            expect(duplicate.valid?).to be_falsey
            expect(duplicate.errors.messages[:name]).to eq ["has already been taken"]
          end
        end
      end
    end
  end
end
