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

  		#@token_request = @client.auth_code.get_token(params[:code], :redirect_uri => @client_redirect_url)
#@token_request.options[:header_format] = "OAuth %s"
#@token_string = token_request.token

require 'uri'
require 'net/http'

url = URI("https://api.trakt.tv/oauth/token")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW'
request["cache-control"] = 'no-cache'
request["postman-token"] = 'e397b823-baf4-9c65-5978-ec4f0afe8435'
request.body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"code\"\r\n\r\n"+params["code"]+"\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"client_id\"\r\n\r\n6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"client_secret\"\r\n\r\n5e1c6d482224119ba52e794f7f8aaf8a9a08fc7fb612efd0c23b87dda7a1fad1\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"redirect_uri\"\r\n\r\nhttps://mighty-ocean-92089.herokuapp.com/pages/confirm\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"grant_type\"\r\n\r\nauthorization_code\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"

response = http.request(request)
puts response.read_body

  	end


  	

end
