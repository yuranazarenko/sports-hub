# frozen_string_literal: true

require "rails_helper"

RSpec.describe SubCategoryBlueprint do
  context "testing sub category blueprint" do
    context "basic" do
      let(:name) { "new_sub_category" }
      let(:category) { create(:category) }
      let(:sub_category) { create(:sub_category, name: name, category: category) }
      subject { described_class.render_as_hash(sub_category, view: :basic) }

      it "checks the content" do
        expect(subject).to eq(id: sub_category.id, name: name, category_id: category.id)
      end
    end
  end
end
