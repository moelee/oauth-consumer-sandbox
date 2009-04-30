class OauthsController < ApplicationController
  before_filter :must_be_logged_in

  # Placeholder page before entering the oauth sequence to import resources
  def index
    
  end

  def import_resources
    # Create a consumer object
    @consumer = OAuth::Consumer.new(ENV['OAUTH_KEY'], ENV['OAUTH_SECRET'], {:site => ENV['OAUTH_SITE']})
    
    # Ask for a request token
    @request_token = @consumer.get_request_token
    session[:request_token] = @request_token
  end
  
  def callback
  end
end