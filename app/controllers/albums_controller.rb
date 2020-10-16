class AlbumsController < ApplicationController
	def index
		@albums = Album.order(:name).page(params[:page])
	end
end
