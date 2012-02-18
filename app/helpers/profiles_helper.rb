module ProfilesHelper
  
  def link_to_category(category)
    link_text = "#{category['_id']} (#{category['value'].to_i})" 
    link_to link_text, profiles_path(:category => category['_id']), 
      :class => [:btn, 'btn-small', 'btn-primary', :category]
  end
end
