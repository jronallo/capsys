class Profile
  include MongoMapper::Document
  
  before_save :update_achievement_count

  key :name, String,        :required => true
  key :url, String,         :required => true
  key :description, String
  key :imlsdcc_identifier, String
  key :categories, Array, :default => ["Unknown"]
  key :achievement_count, Integer, :default => 0
  
  has_many :edits
  
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
  
  def search_url
    uri = Addressable::URI.parse url
    path = if File.split(uri.path).last.include?('.')
      File.split(uri.path).first
    else
      uri.path
    end
    File.join(uri.host, path)
  end
  
  private
  
  def update_achievement_count
    self.achievement_count = self.achievements.count
  end

end
