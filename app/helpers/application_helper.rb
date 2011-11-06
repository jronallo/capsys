module ApplicationHelper 
  
  def incomplete_achievements(profile)
    Achievement.subclasses.select do |klazz|
      true if !profile.send(klazz.to_s.parameterize)
    end
  end
  
end
