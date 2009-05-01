class OauthsController < ApplicationController
  before_filter :login_required
  before_filter :create_consumer

  # Placeholder page before entering the oauth sequence to import resources
  def show
    redirect_to show_resources_oauth_path if current_user.valid_access_token
  end
  
  def show_resources
    abs_url = current_user.valid_access_token.resource_scope['photos']
    @photos = Hash.from_xml(current_user.valid_access_token.get("#{abs_url}/photos.xml").body)
    abs_url = current_user.valid_access_token.resource_scope['contacts']
    @contacts = Hash.from_xml(current_user.valid_access_token.get("#{abs_url}/contacts.xml").body)    
  end

  def import_resources
    # Ask for a request token
    @request_token = @consumer.get_request_token
    session[:request_token] = @request_token.token
    session[:request_token_secret] = @request_token.secret
    redirect_to @request_token.authorize_url
  end
  
  def callback
    # Get an access token
    @request_token=OAuth::RequestToken.new(@consumer, session[:request_token], session[:request_token_secret])
    @access_token = @request_token.get_access_token

    # Store access token in database
    current_user.access_tokens.create(:token => @access_token.token, :secret => @access_token.secret, :resource_scope => @access_token.resource_scope.to_json, :expires_on => Time.at(@access_token.expires_on.to_i))
    
    # Redirect to OAuth show
    redirect_to oauth_path
    
  end
  
protected
  # Create a consumer object
  def create_consumer
    @consumer = OAuth::Consumer.new(ENV['OAUTH_KEY'], ENV['OAUTH_SECRET'], {:site => ENV['OAUTH_SITE']})
  end
end