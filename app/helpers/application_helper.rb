module ApplicationHelper 
  
  def incomplete_achievements(profile)
    Achievement.subclasses.select do |klazz|
      true if !profile.send(klazz.to_s.parameterize)
    end
  end
  
  def category_input_value(profile)
    categories = profile.categories
    if categories == ['Unknown']
      ''
    else
      categories.join(', ')
    end
  end
  
  def project_twitter_url
    'http://twitter.com/ronallo'
  end
  
end
