class OauthsController < ApplicationController
  #before_filter :must_be_logged_in

  # Placeholder page before entering the oauth sequence to import resources
  def welcome
  end

  def import_resources
    # Create a consumer object
    @consumer = OAuth::Consumer.new(ENV['OAUTH_KEY'], ENV['OAUTH_SECRET'], {:site => ENV['OAUTH_SITE']})
    
    # Ask for a request token
    @request_token = @consumer.get_request_token
    session[:request_token] = @request_token.token
    session[:request_token_secret] = @request_token.secret
    redirect_to @request_token.authorize_url
  end
  
  def callback
    # Create a consumer object
    @consumer = OAuth::Consumer.new(ENV['OAUTH_KEY'], ENV['OAUTH_SECRET'], {:site => ENV['OAUTH_SITE']})
    
    @request_token=OAuth::RequestToken.new(@consumer, session[:request_token], session[:request_token_secret])
    @access_token = @request_token.get_access_token
    @photos = @access_token.get('/photos.xml').body
    
  end
end