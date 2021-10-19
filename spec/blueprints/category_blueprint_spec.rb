# frozen_string_literal: true

require "rails_helper"

RSpec.describe CategoryBlueprint do
  context "testing category blueprint" do
    context "basic" do
      let(:name) { "new_category" }
      let(:category) { create(:category, name: name) }
      let(:blueprint_category) { CategoryBlueprint.render_as_hash(category, view: :basic) }

      it "validates numbers of elements" do
        expect(blueprint_category.count).to eql(2)
      end

      it "checks the content" do
        expect(blueprint_category).to include(
          name: name
        )
      end
    end
  end
end
