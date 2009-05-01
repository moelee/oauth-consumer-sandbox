# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

# Key/secret for OAuth on AuthSP (development)
ENV['OAUTH_KEY'] = 'vFxTIyt66ADFDisgmAw'
ENV['OAUTH_SECRET'] = 'blMLyefYPobk62XCvshKpM1M4nFGfSEp0Im0jIEsYo'
ENV['OAUTH_SITE'] = 'http://localhost:3001'