# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :authenticate_user!
end
