# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: "User" do
    email { "valid_email@gmail.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
