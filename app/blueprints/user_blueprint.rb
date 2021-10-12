# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
  identifier :id

  view :basic do
    fields :first_name, :last_name, :email, :admin
  end
end
