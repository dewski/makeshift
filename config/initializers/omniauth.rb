# Be sure to restart your server when you modify this file.

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, Rails.application.secrets.github_client_id, Rails.application.secrets.github_client_secret, scope: 'user'
end

OmniAuth.config.logger = Rails.logger
