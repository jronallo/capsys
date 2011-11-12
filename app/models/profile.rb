class Profile
  include MongoMapper::Document

  key :name, String,        :required => true
  key :url, String,         :required => true
  key :description, String
  key :imlsdcc_identifier, String
  key :categories, Array
  
  has_many :achievements
  one :sitemap
  one :robotstxt
  
  validates :url, :uri => { :format => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

  timestamps!
  
  def as_json(options={})
    json_achievements = {}
    achievements.each do |achievement|
      json_achievements[achievement["_type"].downcase] = achievement
    end
    super.merge(:achievements => json_achievements)
  end

end
