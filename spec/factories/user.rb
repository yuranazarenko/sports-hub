# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: "User" do
    first_name { "First name" }
    last_name { "Last name" }
    sequence(:email) { |n| "valid-email#{n}@gmail.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
