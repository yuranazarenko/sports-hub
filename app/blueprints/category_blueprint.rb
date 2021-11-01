# frozen_string_literal: true

class CategoryBlueprint < Blueprinter::Base
  identifier :id

  view :basic do
    fields :name

    association :sub_categories, blueprint: SubCategoryBlueprint, view: :basic
  end
end
