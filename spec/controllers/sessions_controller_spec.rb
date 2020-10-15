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
  end

end
