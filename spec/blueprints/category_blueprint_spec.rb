# frozen_string_literal: true

require "rails_helper"

RSpec.describe CategoryBlueprint do
  context "testing category blueprint" do
    context "basic" do
      let(:name) { "new_category" }
      let(:category) { create(:category, name: name) }
      let(:blueprint_category) { CategoryBlueprint.render_as_hash(category, view: :basic) }

      it "checks the content" do
        expect(blueprint_category).to eq(
          id:             category.id,
          name:           name,
          sub_categories: []
        )
      end
    end
  end
end
