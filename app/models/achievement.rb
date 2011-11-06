class Achievement
  include MongoMapper::Document

  timestamps!

end
%w(sitemap).each do |r| 
  require_dependency r
end if Rails.env.development?
