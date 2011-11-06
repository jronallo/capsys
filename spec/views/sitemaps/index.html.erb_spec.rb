require 'spec_helper'

describe "sitemaps/index.html.erb" do
  before(:each) do
    assign(:sitemaps, [
      stub_model(Sitemap,
        :url => "Url",
        :valid => false
      ),
      stub_model(Sitemap,
        :url => "Url",
        :valid => false
      )
    ])
  end

  it "renders a list of sitemaps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
