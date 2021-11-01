# frozen_string_literal: true

module Admin
  module InformationArchitectures
    class SubCategoriesController < BaseController
      def create
        category = Category.find_by(id: params[:category_id])
        @sub_category = SubCategory.new(category_params)

        if category.present? && @sub_category.save
          create_flash(:success)
        else
          create_flash(:error)
        end
        session[:active_category_id] = category.id if category.present?
        redirect_to admin_information_architectures_path
      end

      private

      def category_params
        params.permit(:name, :category_id)
      end

      def create_flash(code)
        message = Flash::SubCategoryHelper::RESULT_CODE_DATA[code]
        flash[:theme] = message[:theme]
        flash[:icon] = message[:icon]
        flash[:note] = message[:note]
      end
    end
  end
end
