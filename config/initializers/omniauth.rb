Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_APIKEY_FOR_HEROKU'], ENV['TWITTER_APISECRET_FOR_HEROKU']
end