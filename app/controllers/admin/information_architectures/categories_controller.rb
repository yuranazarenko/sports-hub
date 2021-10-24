# frozen_string_literal: true

module Admin
  module InformationArchitectures
    class CategoriesController < BaseController
      def create
        @category = Category.new(category_params)

        if @category.save
          create_flash(:success)
        else
          create_flash(:error)
        end
        redirect_to admin_information_architectures_path
      end

      private

      def category_params
        params.permit(:name)
      end

      def create_flash(code)
        message = Flash::CategoryHelper::RESULT_CODE_DATA[code]
        flash[:theme] = message[:theme]
        flash[:icon] = message[:icon]
        flash[:note] = message[:note]
      end
    end
  end
end
