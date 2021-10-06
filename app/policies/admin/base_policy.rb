# frozen_string_literal: true

module Admin
  class BasePolicy < ApplicationPolicy
    attr_reader :user, :record

    def index?
      user.admin?
    end
  end
end
