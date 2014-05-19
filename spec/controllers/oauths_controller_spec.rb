require 'spec_helper'

describe OauthsController do

  describe "GET 'oauth'" do
    it "returns http success" do
      get 'oauth'
      response.should be_success
    end
  end

  describe "GET 'callback'" do
    it "returns http success" do
      get 'callback'
      response.should be_success
    end
  end

end
