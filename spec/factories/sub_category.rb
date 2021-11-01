# frozen_string_literal: true

FactoryBot.define do
  factory :sub_category, class: "SubCategory" do
    sequence(:name) { |n| "sub-category-#{n}" }
  end
end
