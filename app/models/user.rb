class User
  include MongoMapper::Document

  key :provider, String
  key :uid, String
  key :name, String
  key :nickname, String
  key :image, String
  key :description, String
  key :website, String
  key :twitter, String
  
  has_many :edits
  
  def self.create_with_omniauth(auth)
    info = auth['info']
    new_user = {
      :provider => auth["provider"],
      :uid => auth["uid"], 
      :name => info["name"],
      :nickname => info['nickname'],
      :image => info['image'],
      :description => info['description'],
    }
    if info['urls']
      new_user[:website] = info['urls']['Website']
      new_user[:twitter] = info['urls']['Twitter']
    end    
    create!(new_user)
  end

end
