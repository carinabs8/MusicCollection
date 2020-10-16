class ArtistsController < ApplicationController
	def index
		@artists = JSON.parse(ArtistServer.new.get_all.body)
	end
end
