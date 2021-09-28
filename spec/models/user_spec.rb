# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  context "user attrs validation" do
    let(:user) { build(:user) }
    it "accepts valid params" do
      expect(user.valid?).to be_truthy
    end

    context "role of the created user" do
      it "sets user default admin flag to false" do
        expect(user.admin?).to be_falsey
      end
    end

    context "invalid params" do
      context "invalid email" do
        context "domain is missing" do
          let(:user) { build(:user, email: "valid_email@gmail") }
          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end

        context "name missing" do
          let(:user) { build(:user, email: "@example.com") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end

        context "@ missing" do
          let(:user) { build(:user, email: "example.com") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end
      end

      context "invalid password" do
        context "too short password" do
          let(:user) { build(:user, password: "1") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end

        context "too long password" do
          let(:user) { build(:user, password: "12345678901234567890123456789012345678901") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end

        context "different password and password confirmation" do
          let(:user) { build(:user, password: "123456", password_confirmation: "654321") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end
      end
    end
  end
end