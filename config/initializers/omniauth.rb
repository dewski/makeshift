# Be sure to restart your server when you modify this file.

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, Rails.application.secrets.github_key, Rails.application.secrets.github_secret, scope: 'user'
end
