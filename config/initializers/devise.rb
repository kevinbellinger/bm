
Devise.setup do |config|

   config.secret_key = ENV['DEVISE_SECRET_KEY']

 

  config.mailer_sender = 'signup@glider.io'


  require 'devise/orm/active_record'


  config.case_insensitive_keys = [ :email ]


  config.strip_whitespace_keys = [ :email ]


  config.skip_session_storage = [:http_auth]


  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true


  config.password_length = 8..128


  config.reset_password_within = 6.hours


  config.sign_out_via = :delete



    Devise.setup do |config|

    config.omniauth :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
    config.omniauth :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
    config.omniauth :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
    config.omniauth :windowslive, ENV['LIVE_KEY'], ENV['LIVE_SECRET'], :scope => 'wl.offline_access'
    end
end
