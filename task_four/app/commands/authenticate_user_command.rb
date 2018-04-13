# frozen_string_literal: true

class AuthenticateUserCommand < BaseCommand
  private

  attr_reader :login, :password

  def initialize(login, password)
    @login = login
    @password = password
  end

  def user
    @user ||= User.find_by(login: login)
  end

  def password_valid?
    user&.authenticate(password)
  end

  def payload
    if password_valid?
      @result = JwtService.encode(contents)
    else
      errors.add(:base, 'User credentials invalid!')
    end
  end

  def contents
    {
      user_id: user.id.to_s,
      login: user.login,
      exp: 24.hours.from_now.to_i
    }
  end
end
