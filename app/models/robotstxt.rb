class Robotstxt < Achievement
  belongs_to :profile
  
  key :text
  
  def self.name_title
    'Robots.txt'
  end
  
end
