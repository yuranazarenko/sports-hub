# frozen_string_literal: true

module Flash
  module SubCategoryHelper
    RESULT_CODE_DATA = {
      success: {
        theme: "success",
        icon:  "check",
        note:  "Sub category saved"
      },
      error:   {
        theme: "danger",
        icon:  "ban",
        note:  "Could not save sub category"
      }
    }.freeze
  end
end
