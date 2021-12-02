# frozen_string_literal: true

module Admin
  class InformationArchitecturesController < BaseController
    def index
      authorize %i[admin information_architectures]
      categories = Category.all.includes(:sub_categories).order(:name)
      @categories = CategoryBlueprint.render_as_hash(categories, view: :basic)
      session[:active_category_id] ||= @categories.first&.dig(:id)
      @active_category_id = session[:active_category_id]
    end
  end
end
