require 'spec_helper'

describe SessionsController do

  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:linked_in]
  end

  describe "#create" do
    before do
      stub_request(:get, "https://api.linkedin.com/v1/people/~:(certifications,educations,phone-numbers,positions,picture-url,skills,summary)").
         to_return(:status => 200, :body => fixture("linked_in_profile.json"), :headers => {})
    end


    it "should create a new user using omniauth" do
      get :create, :provider => 'linked_in'
      @user = User.last
      @user.provider.should == "linked_in"
    end
  end

  describe "GET 'destroy'" do
    it "should destroy the session" do
      get 'destroy'
      session['user_id'].should be_nil
      response.should redirect_to root_path
    end
  end

end
