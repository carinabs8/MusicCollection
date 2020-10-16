#encoding: utf-8
require 'rails_helper'

RSpec.describe Album, type: :model do
  let(:album){ create(:album) }

  context :validations do
    [:name, :artist_name, :twitter, :year].each do |attr|
      it "Cannot be blank" do
        album.attributes = {artist_id: nil, "#{attr}" => ""}
        expect(album.valid?).to eq(false)
      end
    end
  end

  it "Should create a valid user" do
    album.attributes = {name: "name", artist_name: "artist_name", twitter: "twitter", artist_id: 1, year: 2017}
    expect(album.save).to eq(true)
  end

  describe :artists_collection do
    it "Should return an array of name and artists id" do
      allow_any_instance_of(ArtistServer).to receive(:get_all_body).and_return({"1"=>{"id"=>1, "twitter"=>"@justinbieber", "name"=>"Justin Bieber"}, "2"=>{"id"=>2, "twitter"=>"@katyperry", "name"=>"Katy Perry"}})
      expect(Album.artists_collection).to eq([["Justin Bieber", "1"], ["Katy Perry", "2"]])
    end
  end

  describe :set_artist_attributes do
    it "should set all attributes of artists before all validations" do
      album.attributes = {artist_name: nil, twitter: nil, artist_id: 1}
      allow_any_instance_of(ArtistServer).to receive(:get_by_id).with(1).and_return({id: 1, twitter: "twitter", artist_name: "name"})
      expect(album.save).to eq(true)
    end
  end
end
