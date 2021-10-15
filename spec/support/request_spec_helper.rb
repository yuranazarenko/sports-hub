# frozen_string_literal: true

module RequestSpecHelper
  def sign_in_admin
    before(:each) do
      sign_in admin_user
    end
  end

  def sign_in_user
    before(:each) do
      sign_in user
    end
  end
end
