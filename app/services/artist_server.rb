class ArtistServer
	attr_reader :http_response

	def initialize
		@conn = Connection.new.conn
	end

	def get_all
		@http_response = @conn.get
	end
end