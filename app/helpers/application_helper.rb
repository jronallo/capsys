module ApplicationHelper 
  
  def app_name
    'Collection Achievements and Profiles System'
  end
  
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
  
  def current_user_in_nav
    content = ''
    content = image_tag(current_user.image, :class => "small-image") + ' ' if current_user.image
    content << current_user.name
    link_to content, current_user
  end
  
end
