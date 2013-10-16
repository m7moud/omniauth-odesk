require 'rubygems'
require 'oauth'
require 'json'
require 'omniauth-odesk'

auth={}

# This is the demonstration of sending a request containing all OAuth 1.0 params
# in a request using the oauth token and secret obtained against a consumer key
# and secret received.

puts "Preconditions:"
puts "1. You must be having the Consumer Key and Consumer Secret assigned by Odesk"
puts "For obtaining them you can visit following page: https://www.odesk.com/services/api/keys"
puts "2. You must be having the oauth_token and oauth_token_secret generated against the Consumer Key and Consumer Secret mentioned above."

puts "\n"

puts "Enter the consumer key you are assigned:"
auth[:consumer_key] = gets.strip
puts "Enter the consumer secret you are assigned:"
auth[:consumer_secret] = gets.strip

puts "Enter the oauth token you are assigned:"
auth[:oauth_token] = gets.strip
puts "Enter the oauth token secret you are assigned:"
auth[:oauth_token_secret] = gets.strip

client_opts = OmniAuth::Strategies::Odesk.default_options[:client_options]
@consumer = OAuth::Consumer.new(auth[:consumer_key], auth[:consumer_secret], client_opts)

hash = {}
hash.merge!(oauth_token: auth[:oauth_token])
hash.merge!(oauth_token_secret: auth[:oauth_token_secret])

access_token = OAuth::AccessToken.from_hash(@consumer, hash)

MY_TEAMS_INFO_URL = '/api/hr/v2/teams.json'

puts "Fetching your teams information now..."

raw_info = access_token.get(MY_TEAMS_INFO_URL).read_body

if raw_info
  teams_arr = JSON.parse(raw_info)['teams']

  teams_arr.each do |team|
    parent_team_id = team['parent_team__id']
    is_hidden =  team['is_hidden']
    is_hidden = (is_hidden.nil? or is_hidden.empty?) ? false : is_hidden
    status = team['status']
    accounting_entity_reference = team['accounting_entity__reference']
    name = team['name']
    company_name = team['company_name']
    parent_team_name = team['parent_team__name']
    company_reference = team['company__reference']
    parent_team_reference = team['parent_team__reference']
    reference = team['reference']
    id = team['id']

    puts "Id: #{id}"
    puts "Company Name: #{name}, Reference Id: #{company_reference}"
    puts "Parent Team Name: #{parent_team_name}, Id: #{parent_team_id}, Reference Id: #{parent_team_reference}"
    puts "Hidden?  #{is_hidden}"
    puts "Status: #{status}"
    puts "Accounting Entity Reference: #{accounting_entity_reference}"
  end

end