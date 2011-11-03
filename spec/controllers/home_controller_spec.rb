require 'spec_helper'

describe HomeController do

  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:linked_in]
    session[:user_id] = 1
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
