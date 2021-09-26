# frozen_string_literal: true

class User < ApplicationRecord
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :validatable,
         jwt_revocation_strategy: JwtDenylist
end
