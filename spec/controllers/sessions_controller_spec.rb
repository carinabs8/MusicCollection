require 'rails_helper'

RSpec.describe Users::SessionsController, :type => :controller do
	before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
	end

  let(:user) {create(:user, role: :admin)}

  describe "GET 'new'" do
    it "should return 200 - ok - http success" do
      get 'new'
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET 'create'" do
    it "should return 302 - redirect - when logged successfully" do
      post :create, params: {user: {username: user.username, password: user.password}}
      expect(response).to have_http_status(:redirect)
    end

    it "Should return 'Sorry, we couldn't find an account with this username. Please check you're using the right username and try again.' when user try to authenticate with invalid login" do
      post :create, params: {user: {username: user.username, password: "ooo"}}
      expect(flash["alert"]).to eq("Sorry, we couldn't find an account with this username. Please check you're using the right username and try again.")
    end

    it "Should redirect to Artists list when succefully logged" do
      post :create, params: {user: {username: user.username, password: user.password}}
      expect(response).to redirect_to(artists_path)
    end
  end

end
