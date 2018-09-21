require 'net/http'

# Service for making API requests
class APIService
  def initialize(url)
    @url = url
  end

  def post_request(headers = {}, params = {})
    begin
      uri = URI.parse(@url)

      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      request.body = params.to_json

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')

      http.request(request)
    rescue StandardError => e
      #log the error somewhere internally, or post to rollbar etc
    end
  end

end
