require 'faraday_middleware'
require 'faraday-http-cache'

class Connection
	attr_reader :conn

	def initialize
		@conn = connection
	end

	private
	def http_service_faraday
		Faraday.new(url: ENV["ARTISTS_URL"]) do |faraday|
			faraday.headers['Content-Type'] = 'application/json'
			faraday.request :url_encoded
			faraday.use :http_cache, store: Rails.cache, logger: Logger.new(STDOUT)
			faraday.adapter Faraday.default_adapter
		end
	end

	def connection
		conn = http_service_faraday
		conn
	end
end