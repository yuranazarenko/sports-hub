# frozen_string_literal: true

module Flash
  module CategoryHelper
    RESULT_CODE_DATA = {
      success:              {
        theme: "success",
        icon:  "check",
        note:  "Category saved"
      },
      error:                {
        theme: "danger",
        icon:  "ban",
        note:  "Could not save category"
      },
      category_not_found:   {
        theme: "danger",
        icon:  "ban",
        note:  "Category not found"
      },
      category_deleted:     {
        theme: "success",
        icon:  "check",
        note:  "Category deleted"
      },
      category_not_deleted: {
        theme: "danger",
        icon:  "ban",
        note:  "Category not deleted"
      },
      category_updated:     {
        theme: "success",
        icon:  "check",
        note:  "Category updated"
      },
      category_not_updated: {
        theme: "danger",
        icon:  "ban",
        note:  "Category not updated"
      }
    }.freeze
  end
end
