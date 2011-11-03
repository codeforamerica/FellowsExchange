require 'spec_helper'

describe UsersController do
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
      stub_request(:get, "https://api.linkedin.com/v1/people/~:(id,first-name,last-name,headline,location,industry,distance,relation-to-viewer,current-share,connections,num-connections,num-connections-capped,summary,specialties,proposal-comments,associations,honors,interests,positions,publications,patents,languages,skills,certifications,educations,three-current-positions,three-past-positions,num-recommenders,recommendations-received,phone-numbers,im-accounts,twitter-accounts,date-of-birth,main-address,member-url-resources,picture-url,site-standard-profile-request,api-public-profile-request,site-public-profile-request,api-standard-profile-request,public-profile-url)").
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

