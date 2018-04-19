# frozen_string_literal: true

class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  validates :login, uniqueness: true
  validates :login, format: { with: /\d{3}.*_\w{2,3}/, message: 'like this 777_aaa, or 777-1_bbb' }
  field :login, type: String
  field :password_digest, type: String
end
