require 'spec_helper'

describe "sitemaps/new.html.erb" do
  before(:each) do
    assign(:sitemap, stub_model(Sitemap,
      :url => "MyString",
      :valid => false
    ).as_new_record)
  end

  it "renders new sitemap form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sitemaps_path, :method => "post" do
      assert_select "input#sitemap_url", :name => "sitemap[url]"
      assert_select "input#sitemap_valid", :name => "sitemap[valid]"
    end
  end
end
