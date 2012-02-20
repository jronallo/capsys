class Edit
  include MongoMapper::Document
  
  key :action, String
  key :achievement_type, String
  
  belongs_to :profile
  belongs_to :user
  belongs_to :achievement
  belongs_to :sitemap
  timestamps!

end
