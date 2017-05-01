class PagesController < ApplicationController

  def index

require "oauth2"
	@client_id = "6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4"
@client_secret = "5e1c6d482224119ba52e794f7f8aaf8a9a08fc7fb612efd0c23b87dda7a1fad1"
@client_url = 'https://mighty-ocean-92089.herokuapp.com/'
@client_redirect_url = 'https://mighty-ocean-92089.herokuapp.com/pages/confirm'
@client = OAuth2::Client.new(@client_id, @client_secret, :token_url => '/oauth/token', :site =>'https://trakt.tv')
  	

@authorize_url = @client.auth_code.authorize_url(:redirect_uri => @client_redirect_url, :response_type => 'code')
  	end 

  	def oAuth
  		@token_request = @client.auth_code.get_token(params[:code], :redirect_uri => @client_redirect_url)
@token_request.options[:header_format] = "OAuth %s"
@token_string = token_request.token

  	end


  	

end
