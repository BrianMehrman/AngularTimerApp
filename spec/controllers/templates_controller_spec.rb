require 'spec_helper'

describe TemplatesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'template'" do
    it "returns http success" do
      get 'template'
      response.should be_success
    end
  end

end
