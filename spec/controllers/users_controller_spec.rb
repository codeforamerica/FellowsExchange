require 'spec_helper'

describe UsersController do

  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:linked_in]
    session[:user_id] = 1
  end

  describe "#index" do
    it "should render the index template" do
      get :index
      response.should render_template("users/index")
    end
  end

  describe "#show and #edit" do
    before do
      Factory(:user)
      @users = User.find(:first)
      stub_request(:get, "https://api.linkedin.com/v1/people/id=bSNqC4s_4k:(id,first-name,last-name,headline,location,summary,specialties,interests,positions,languages,skills,site-standard-profile-request,educations,three-current-positions,three-past-positions,picture-url)").
          to_return(:status => 200, :body => fixture("linked_in_profile.json"), :headers => {})
    end

    it "should render the show template" do
      get :show, :id => @users
      response.should render_template("users/show")
    end

    describe "edit action should render edit template" do
      it "should be successful" do
        get :edit, :id => @users
        response.should render_template("users/edit")
      end
    end
  end

    before do
      @users = Factory(:user)
      put :update, :id => @users.id, :user => { :interest_list => "Ruby" }
    end

    it "should update the user interest" do
      @users.reload.interest_list.should == ["Ruby"]
    end
end

