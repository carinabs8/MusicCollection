#encoding: utf-8
require 'rails_helper'

RSpec.describe Album, type: :model do
  let(:album){ create(:album) }

  context :validations do
    [:name, :artist_name, :twitter, :artist_id, :year].each do |attr|
      it "Cannot be blank" do
        album.send("#{attr}=", "")
        expect(album.valid?).to eq(false)
      end
    end
  end

  it "Should create a valid user" do
    album.attributes = {name: "name", artist_name: "artist_name", twitter: "twitter", artist_id: 1, year: 2017}
    expect(album.save).to eq(true)
  end
end
