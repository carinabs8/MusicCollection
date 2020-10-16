class AlbumsController < ApplicationController
	def index
		@albums = Album.order(:name).page(params[:page])
	end

	def new
		@album = Album.new
	end

	def create
		@album = Album.new(album_params)
		if(@album.save)
			redirect_to albums_path, notice: "Successfully created"
		else
			render :new
		end
	end

	protected
	def album_params
		params.require(:album).permit(:name, :artist_name, :twitter, :artist_id, :year)
	end
end