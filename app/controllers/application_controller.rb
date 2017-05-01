class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello

  	require 'oauth2'

 client = OAuth2::Client.new(
  "6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4",
  "5e1c6d482224119ba52e794f7f8aaf8a9a08fc7fb612efd0c23b87dda7a1fad1", 
  :authorize_url => "/oauth/authorize", 
  :token_url => "/oauth/token", 
  :site => "https://trakt.tv/"
 )

puts client.auth_code.authorize_url(:redirect_uri => "http://localhost:3000/oauth2/callback")

code = gets.chomp

token = client.auth_code.get_token(code, :redirect_uri => "http://localhost:3000/oath2/callback")

token = OAuth2::AccessToken.new(client, token.token, {
  :mode => :query,
  :param_name => "oauth_token",
})

#response = token.get('https://api.foursquare.com/v2/users/self/checkins')

puts  token.body

  	
  end
end
