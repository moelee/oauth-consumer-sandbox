class OauthsController < ApplicationController
  before_filter :login_required

  # Placeholder page before entering the oauth sequence to import resources
  def show
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
    
    # Get an access token
    @request_token=OAuth::RequestToken.new(@consumer, session[:request_token], session[:request_token_secret])
    @access_token = @request_token.get_access_token
    debugger
    # Store access token in database
    current_user.access_tokens.create(:token => @access_token.token, :secret => @access_token.secret, :resource_scope => @access_token.resource_scope.to_json, :expires_on => Time.parse(@access_token.expires_on))
    
    # I want the photos resource (on the AuthSP server)
    @photos = Hash.from_xml(@access_token.get('/photos.xml').body)
    
    # I also want the address book resource (on the ChildSP server)
    #@address_book = @access_token.get('/address_books.xml').body
    
  end
end