class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(auth_token = nil)
    @auth_token = auth_token
  end

  def call
    user
  end

  private

  attr_reader :auth_token

  def user
    token = decoded_auth_token
    unless token && errors.empty?
      errors.add(:invalid_token, 'Invalid token')
      return
    end

    user = User.find(token[:user_id])
    return user if user

    errors.add(:invalid_token, 'Invalid token')
  end

  def decoded_auth_token
    JsonWebToken.decode(get_auth_token)
  end

  def get_auth_token
    return auth_token if auth_token

    errors.add(:missing_token, 'Missing token')
  end
end
