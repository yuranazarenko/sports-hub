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
      context "invalid first name" do
        context "too short first name" do
          let(:user) { build(:user, first_name: "a") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end

        context "too long first name" do
          let(:user) { build(:user, first_name: "qwertyuiopasdfghjklzxcvbnmqwert") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end
      end

      context "invalid last name" do
        context "too short last name" do
          let(:user) { build(:user, last_name: "a") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end

        context "too long last name" do
          let(:user) { build(:user, last_name: "qwertyuiopasdfghjklzxcvbnmqwert") }

          it "properly validates params" do
            expect(user.valid?).to be_falsey
          end
        end
      end

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

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
