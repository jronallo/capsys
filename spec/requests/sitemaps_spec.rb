require 'spec_helper'

describe "Sitemaps" do
  describe "GET /sitemaps" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sitemaps_path
      response.status.should be(200)
    end
  end
end
