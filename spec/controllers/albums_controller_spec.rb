require 'rails_helper'

RSpec.describe AlbumsController, :type => :controller do
	before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
	end

  let(:user) {create(:user, role: :admin)}

  describe "GET 'index'" do

    it "should have access to list of artists" do
      sign_in(user)
      get 'index'
      expect(response).to have_http_status(:success)
    end

    it "Shouldnt be allow user that is not log in" do
      get 'index'
      expect(response).to have_http_status(302)
    end
  end

  describe "GET 'new'" do
    before(:each) do
      allow_any_instance_of(ArtistServer).to receive(:get_all).and_return({"1"=>{"id"=>1, "twitter"=>"@justinbieber", "name"=>"Justin Bieber"}, "2"=>{"id"=>2, "twitter"=>"@katyperry", "name"=>"Katy Perry"}})
    end
    
    it "should have access to new album page" do
      sign_in(user)
      get 'new'
      expect(response).to have_http_status(:success)
    end

    it "Shouldnt be allow user that is not log in" do
      get 'new'
      expect(response).to have_http_status(302)
    end
  end

  describe "GET 'create'" do
    before(:each) do
      allow_any_instance_of(ArtistServer).to receive(:get_all).and_return({"1"=>{"id"=>1, "twitter"=>"@justinbieber", "name"=>"Justin Bieber"}, "2"=>{"id"=>2, "twitter"=>"@katyperry", "name"=>"Katy Perry"}})
    end

    it "should create new album page" do
      sign_in(user)
      post 'create', params: {album: {name: "KAty", artist_name: "Perry", twitter: "katy1", artist_id: 1, year: 2018}}
      expect(response).to redirect_to(albums_path)
    end

    it "should render to new action if record wasnt save" do
      sign_in(user)
      post 'create', params: {album: {name: "KAty", artist_name: "Perry", twitter: "", artist_id: 1}}
      expect(response).to render_template("albums/new")
    end

    it "Shouldnt be allow user that is not log in" do
      post 'create', params: {album: {name: "KAty", artist_name: "Perry", twitter: "katy1", artist_id: 1}}
      expect(response).to have_http_status(302)
    end
  end

end
