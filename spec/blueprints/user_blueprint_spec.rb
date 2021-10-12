# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserBlueprint do
  context "testing user blueprint" do
    context "basic" do
      let(:admin_user) { create(:user, admin: true) }
      let(:blueprint_user) { UserBlueprint.render_as_hash(admin_user, view: :basic) }

      it "validates numbers of elements" do
        expect(blueprint_user.count).to eql(5)
      end

      it "checks the content" do
        expect(blueprint_user).to include(
          admin:      true,
          email:      "valid_email@gmail.com",
          first_name: "First name",
          last_name:  "Last name"
        )
      end
    end
  end
end
