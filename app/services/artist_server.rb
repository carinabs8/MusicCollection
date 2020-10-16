class ArtistServer
	attr_reader :http_response

	def initialize
		@conn = Connection.new.conn
	end

	def get_all_body
		JSON.parse(get_all.body)
	end

	def get_by_id(id)
		return if id.blank?
		get_all_body[id.to_s].map{|key, value| {attributes[key] => value} }
	end

	private
	def attributes
		{"id"=> :artist_id , "twitter"=> :twitter, "name"=> :artist_name}
	end

	def get_all
		@http_response = @conn.get
	end
end