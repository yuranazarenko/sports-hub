# frozen_string_literal: true

module Admin
  class InformationArchitecturesPolicy < BasePolicy
    attr_reader :user, :record

    def index?
      user.admin?
    end

    def show_category?
      user.admin?
    end
  end
end
