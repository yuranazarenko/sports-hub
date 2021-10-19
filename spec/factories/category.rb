# frozen_string_literal: true

FactoryBot.define do
  factory :category, class: "Category" do
    sequence(:name) { |n| "category-#{n}" }
  end
end
