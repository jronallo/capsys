require "spec_helper"

describe SitemapsController do
  describe "routing" do

    it "routes to #index" do
      get("/sitemaps").should route_to("sitemaps#index")
    end

    it "routes to #new" do
      get("/sitemaps/new").should route_to("sitemaps#new")
    end

    it "routes to #show" do
      get("/sitemaps/1").should route_to("sitemaps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sitemaps/1/edit").should route_to("sitemaps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sitemaps").should route_to("sitemaps#create")
    end

    it "routes to #update" do
      put("/sitemaps/1").should route_to("sitemaps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sitemaps/1").should route_to("sitemaps#destroy", :id => "1")
    end

  end
end
