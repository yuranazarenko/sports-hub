# frozen_string_literal: true

class CategoryBlueprint < Blueprinter::Base
  identifier :id

  view :basic do
    fields :name
  end
end
