# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
    
  helper :all # include all helpers, all the time
  ENV['CONSUMER_KEY'] = "geGitEHsvUOnZnPCm0fPjg"
  ENV['CONSUMER_SECRET'] = "7K5x1jAIneCQ2o0jXxUQQKBm6XrHni3S7NrAeviKDQ"

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9fb17a81fcf8897dbd641572cdcedb28'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
