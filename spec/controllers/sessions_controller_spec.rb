require 'spec_helper'

describe SessionsController do

  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:linked_in]
  end


    describe "#create" do
      it "should create a new user using omniauth" do
        get :create, :provider => 'linked_in'
        @user = User.last
        @user.provider.should == "linked_in"
      end
    end

end
