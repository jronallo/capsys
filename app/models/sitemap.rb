class Sitemap < Achievement

  key :url, String
  key :valid_sitemap, Boolean, :default => false
  
  belongs_to :profile
  
  validates :url, :uri => { :format => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }
  validates :url, :sitemap => nil
  
  def self.name_title
    'Sitemap'
  end

end
