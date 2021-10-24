# frozen_string_literal: true

module Flash
  module CategoryHelper
    RESULT_CODE_DATA = {
      success: {
        theme: "success",
        icon:  "check",
        note:  "Category saved"
      },
      error:   {
        theme: "danger",
        icon:  "ban",
        note:  "Could not save category"
      }
    }.freeze
  end
end
