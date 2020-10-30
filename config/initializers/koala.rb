# In Rails, you could put this in config/initializers/koala.rb
Koala.configure do |config|
    config.app_id = "2840122139650715"
    config.app_secret = "0dfc0600b43feb0fe0b826f652bf93ab"
    # config.access_token = MY_TOKEN
    # config.app_access_token = MY_APP_ACCESS_TOKEN
    
    # See Koala::Configuration for more options, including details on how to send requests through
    # your own proxy servers.
  end