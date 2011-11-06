class Profile
  include MongoMapper::Document

  key :name, String #,        :required => true
  key :url, String #,         :required => true
  key :description, String
  
  validates :url, :presence => true, :uri => { :format => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

  timestamps!

end
