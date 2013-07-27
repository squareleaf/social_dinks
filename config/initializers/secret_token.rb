# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# Dinks::Application.config.secret_token = '0fe0fdba67009c6bf2f3a7611e2b2e3ffc4d6d4db9d79cc5d85ad7a84500919ab5765ea68b432efe6f82c84d54fc9f3059ce246d572b4812701ed6570c2c7c94'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Dinks::Application.config.secret_key_base = secure_token