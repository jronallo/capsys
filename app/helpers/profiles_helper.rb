module ProfilesHelper
  
  def link_to_category(category)
    link_text = "#{category['_id']} (#{category['value'].to_i})" 
    link_to link_text, profiles_path(:category => category['_id']), 
      :class => [:btn, 'btn-small', 'btn-primary', :category]
  end
  
  def url_with_site_query(text, url, profile)
    site_url = CGI::escape(profile.search_url)
    link_to text, "http://#{url}?q=site:#{site_url}", :target => '_blank'
  end
  def google_web_link(profile)
    url_with_site_query('Google Web', 'www.google.com/search', profile)
  end
  def google_image_link(profile)
    url_with_site_query('Google Images', 'www.google.com/images', profile)
  end
  def google_video_link(profile)
    url_with_site_query('Google Videos', 'www.google.com/videos', profile)
  end
  def bing_web_link(profile)
    url_with_site_query('Bing Web', 'www.bing.com/search', profile)
  end
  def bing_image_link(profile)
    url_with_site_query('Bing Images', 'www.bing.com/images/search', profile)
  end
  
end
