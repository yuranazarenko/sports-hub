# frozen_string_literal: true

class SubCategory < ApplicationRecord
  belongs_to :category

  validates :name, length: { in: 2..20 }, uniqueness: { scope: :category_id }
end

# == Schema Information
#
# Table name: sub_categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_sub_categories_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
