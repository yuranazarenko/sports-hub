# frozen_string_literal: true

class SubCategoryBlueprint < Blueprinter::Base
  identifier :id

  view :basic do
    fields :name, :category_id
  end
end
