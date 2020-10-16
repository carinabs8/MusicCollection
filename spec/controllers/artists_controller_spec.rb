require 'rails_helper'

RSpec.describe ArtistsController, :type => :controller do
	before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
	end

  let(:user) {create(:user, role: :admin)}

  describe "GET 'index'" do

    it "should have access to list of artists" do
      sign_in(user)
      get 'index'
      allow_any_instance_of(ArtistServer).to receive(:get_all).and_return({"1"=>{"id"=>1, "twitter"=>"@justinbieber", "name"=>"Justin Bieber"}, "2"=>{"id"=>2, "twitter"=>"@katyperry", "name"=>"Katy Perry"}})
      expect(response).to have_http_status(:success)
    end

    it "Shouldnt be allow user that is not log in" do
      get 'index'
      allow_any_instance_of(ArtistServer).to receive(:get_all).and_return({"1"=>{"id"=>1, "twitter"=>"@justinbieber", "name"=>"Justin Bieber"}, "2"=>{"id"=>2, "twitter"=>"@katyperry", "name"=>"Katy Perry"}})
      expect(response).to have_http_status(302)
    end
  end

end
