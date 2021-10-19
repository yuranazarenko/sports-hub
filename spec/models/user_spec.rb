# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model, aggregate_failures: true do
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
      context "invalid first name" do
        context "too short first name" do
          let(:user) { build(:user, first_name: "a") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
            expect(user.errors.messages[:first_name]).to eq ["is too short (minimum is 2 characters)"]
          end
        end

        context "too long first name" do
          let(:user) { build(:user, first_name: "qwertyuiopasdfghjklzxcvbnmqwert") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
            expect(user.errors.messages[:first_name]).to eq ["is too long (maximum is 30 characters)"]
          end
        end
      end

      context "invalid last name" do
        context "too short last name" do
          let(:user) { build(:user, last_name: "a") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
            expect(user.errors.messages[:last_name]).to eq ["is too short (minimum is 2 characters)"]
          end
        end

        context "too long last name" do
          let(:user) { build(:user, last_name: "qwertyuiopasdfghjklzxcvbnmqwert") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
            expect(user.errors.messages[:last_name]).to eq ["is too long (maximum is 30 characters)"]
          end
        end
      end

      context "invalid email" do
        context "domain is missing" do
          let(:user) { build(:user, email: "valid_email@gmail") }
          it "properly validates params" do
            expect(user.valid?).to be_falsey
            expect(user.errors.messages[:email]).to eq ["is invalid", "is invalid"]
          end
        end

        context "name missing" do
          let(:user) { build(:user, email: "@example.com") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
            expect(user.errors.messages[:email]).to eq ["is invalid", "is invalid"]
          end
        end

        context "@ missing" do
          let(:user) { build(:user, email: "example.com") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
            expect(user.errors.messages[:email]).to eq ["is invalid", "is invalid"]
          end
        end
      end

      context "invalid password" do
        context "too short password" do
          let(:user) { build(:user, password: "1") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
            expect(user.errors.messages[:password]).to eq ["is too short (minimum is 6 characters)"]
          end
        end

        context "too long password" do
          let(:user) { build(:user, password: "12345678901234567890123456789012345678901") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
            expect(user.errors.messages[:password]).to eq ["is too long (maximum is 40 characters)"]
          end
        end

        context "different password and password confirmation" do
          let(:user) { build(:user, password: "123456", password_confirmation: "654321") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
            expect(user.errors.messages[:password_confirmation]).to eq ["doesn't match Password"]
          end
        end
      end
    end
  end

  context "testing admins scopes" do
    let(:admin_user) { create(:user, :admin) }

    it "includes users with admin flag" do
      expect(User.admin_users).to include(admin_user)
    end

    let(:user) { create(:user) }

    it "excludes users without admin flag" do
      expect(User.admin_users).not_to include(user)
    end
  end
end
