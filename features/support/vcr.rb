require 'vcr'
VCR.cucumber_tags do |t|
  t.tags '@ncsu', '@ncsu_sitemap', '@no_sitemap', '@bad_sitemap'
end