require 'rubygems'
gem 'google-api-client', '>0.7'
require 'googleauth/stores/file_token_store'
require 'googleauth'
require 'googleauth/web_user_authorizer'
require 'googleauth/stores/redis_token_store'
require 'redis'
require 'google/apis'
# require 'google/apis/youtube_V3'

require 'fileutils'
#
# # REPLACE WITH VALID REDIRECT_URI FOR YOUR CLIENT
REDIRECT_URI = 'http://localhost:3000'
APPLICATION_NAME = 'dogs auth 1'
#
# # REPLACE WITH NAME/LOCATION OF YOUR client_secrets.json FILE
CLIENT_SECRETS_PATH = 'client_secrets.json'
#
# # REPLACE FINAL ARGUMENT WITH FILE WHERE CREDENTIALS WILL BE STORED
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "youtube-ruby-snippet-tests.yaml")
#
# # SCOPE FOR WHICH THIS SCRIPT REQUESTS AUTHORIZATION
SCOPE = Google::Apis::YoutubeV3::AUTH_YOUTUBE_FORCE_SSL
#
def authorize

    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::RedisTokenStore.new(redis: Redis.new)
  authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(base_url: REDIRECT_URI)
    puts "Open the following URL in the browser and enter the " +
           "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: REDIRECT_URI)
  end
  credentials
end
#
# Initialize the API
service = Google::Apis::YoutubeV3::YouTubeService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize
#
# Print response object as JSON
def get_results(response)
  File.write("new_videos.json",response.to_json)
  puts response.to_json
end

# Sample ruby code for search.list
#
def search_list_by_keyword(service, part, **params)
  params = params.delete_if { |p, v| v == ''}
  response = service.list_searches(part, params)
  get_results(response)
end

search_list_by_keyword(service, 'snippet',
                       max_results: 50,
                       q: 'dogs',
                       type: '')
