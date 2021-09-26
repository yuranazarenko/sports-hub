# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  context "user attrs validation" do
    let(:user_attributes) do
      {
        email: email,
        password: password,
        password_confirmation: password_confirmation
      }
    end
    let(:email) { "valid_email@gmail.com" }
    let(:password) { "123456" }
    let(:password_confirmation) { password }
    let(:user) { described_class.new(user_attributes) }

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
          let(:email) { "test@example" }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end

        context "name missing" do
          let(:email) { "@example.com" }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end

        context "@ missing" do
          let(:email) { "example.com" }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end
      end

      context "invalid password" do
        context "too short password" do
          let(:password) { "1" }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end

        context "too long password" do
          let(:password) { "12345678901234567890123456789012345678901" }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end

        context "different password and password confirmation" do
          let(:password) { "123456" }
          let(:password_confirmation) { "654321" }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end
      end
    end
  end
end
