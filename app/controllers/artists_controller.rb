class ArtistsController < ApplicationController
	def index
		@artists = ArtistServer.new.get_all_body
	end
end
