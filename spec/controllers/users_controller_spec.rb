require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    pending it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    pending it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

end
