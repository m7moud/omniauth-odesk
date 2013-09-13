# References:
# http://wiki.openstreetmap.org/wiki/OAuth_ruby_examples
# https://github.com/oauth-xx/oauth-ruby
# https://github.com/oauth-xx/oauth-ruby/tree/master/lib/oauth
require 'rubygems'
require 'oauth'
require 'json'

auth={}

puts "First, create API keys at"
puts "https://www.odesk.com/services/api/keys"
puts "Enter the consumer key you are assigned:"
auth[:consumer_key] = gets.strip
puts "Enter the consumer secret you are assigned:"
auth[:consumer_secret] = gets.strip
puts "Your application is now set up, but you need to register"
puts "this instance of it with your user account."

client_opts = {
  site: "https://www.odesk.com",
  request_token_path: "/api/auth/v1/oauth/token/request",
  authorize_path: "/services/api/auth",
  access_token_path: "/api/auth/v1/oauth/token/access"
}

@consumer = OAuth::Consumer.new(auth[:consumer_key], auth[:consumer_secret], client_opts)
@request_token = @consumer.get_request_token

puts "Visit the following URL, log in if you need to, and authorize the app"
authorize_url = @request_token.authorize_url

puts authorize_url

puts "When you've authorized the request, enter the verifier code you are assigned:"

verifier = gets.strip

puts "Converting the authorization code into access token..."

access_token_params = {
  oauth_verifier: verifier
}

@access_token= @request_token.get_access_token(access_token_params)

auth[:token] = @access_token.token
auth[:token_secret] = @access_token.secret

puts "Done.Following are the credentials to be used to access the API"
puts "#{auth}"

puts "Fetching your basic information now..."

raw_info = @access_token.get('/api/hr/v2/users/me.json').read_body

if raw_info
  user_info = JSON.parse(raw_info)['user']
  id = user_info['id']
  first_name =  user_info['first_name']
  last_name = user_info['last_name']
  email = user_info['email']
  status = user_info['status']
  profile_key = user_info['profile_key']

  puts "Id: #{id}"
  puts "Name: #{first_name} #{last_name}"
  puts "Email: #{email}"
  puts "Status: #{status}"
  puts "Profile Key: #{profile_key}"
end




