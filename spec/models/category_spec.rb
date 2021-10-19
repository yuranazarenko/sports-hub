# frozen_string_literal: true

require "rails_helper"

RSpec.describe Category, type: :model, aggregate_failures: true do
  context "category attrs validation" do
    let(:category) { build(:category) }

    it "accepts valid params" do
      expect(category.valid?).to be_truthy
    end

    context "invalid params" do
      context "invalid name" do
        context "too short name" do
          let(:category) { build(:category, name: "a") }

          it "properly validates params" do
            expect(category.valid?).to be_falsey
            expect(category.errors.messages[:name]).to eq ["is too short (minimum is 2 characters)"]
          end
        end

        context "too long name" do
          let(:category) { build(:category, name: "qwertyuiopasdfghjklzx") }

          it "properly validates params" do
            expect(category.valid?).to be_falsey
            expect(category.errors.messages[:name]).to eq ["is too long (maximum is 20 characters)"]
          end
        end

        context "not unique name" do
          let(:category) { create(:category, name: "ab") }
          let(:duplicate) { build(:category, name: "ab") }
          it "properly validates error (duplicate name)" do
            expect(category.valid?).to be_truthy
            expect(duplicate.valid?).to be_falsey
            expect(duplicate.errors.messages[:name]).to eq ["has already been taken"]
          end
        end
      end
    end
  end
end
