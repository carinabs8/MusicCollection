class ArtistServer
	attr_reader :http_response

	def initialize
		@conn = Connection.new.conn
	end

	def get_all_body
		JSON.parse(get_all.body)
	end

	def get_by_id(id)
		return {artist_id: nil, twitter: nil, artist_name: nil} if id.blank?
		hash_ = {}
		get_all_body[id.to_s].each{|key, value| hash_.merge!({ attributes[key] => value}) }
		hash_
	end

	private
	def attributes
		{"id"=> :artist_id , "twitter"=> :twitter, "name"=> :artist_name}
	end

	def get_all
		@http_response = @conn.get
	end
end