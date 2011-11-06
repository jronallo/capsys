require 'spec_helper'

describe "sitemaps/show.html.erb" do
  before(:each) do
    @sitemap = assign(:sitemap, stub_model(Sitemap,
      :url => "Url",
      :valid => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
