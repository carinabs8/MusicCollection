class Album < ApplicationRecord
	store_accessor :artist,
    :artist_name, :twitter, :artist_id

  validates :name, :artist_name, :twitter, :artist_id, :year, presence: true
  validates :year, :artist_id, numericality: { only_integer: true }

  before_validation :set_artist_attributes

  class << self
    def artists_collection
    	ArtistServer.new.get_all_body.map{|k, v| [v["name"], k]}
    end
  end

  private
  def set_artist_attributes
    return if artist_id.blank?
  	self.attributes = ArtistServer.new.get_by_id(artist_id)
  end
end
