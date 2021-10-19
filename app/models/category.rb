# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, length: { in: 2..20 }, uniqueness: true
end

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
