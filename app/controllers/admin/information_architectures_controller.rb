# frozen_string_literal: true

module Admin
  class InformationArchitecturesController < BaseController
    def index
      authorize %i[admin information_architectures]
      @categories = CategoryBlueprint.render_as_hash(Category.all, view: :basic)
    end
  end
end
