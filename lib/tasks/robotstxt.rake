namespace :dplacaps do
  desc 'attempts to complete the robots.txt achievement for all profiles'
  task :robotstxt => :environment do
    require "open-uri"
    require "uri"
    require 'timeout'
    Profile.find_each do |profile|
      puts profile.name
      puts profile.url
      io = nil
      begin
        Timeout::timeout(3) do
          io = URI.join(profile.url, "/robots.txt").open("User-Agent" => 'DplaCaps') rescue nil
        end
      rescue Timeout::Error
        puts 'Request timed out!'
      end
      if !io || io.content_type != "text/plain" || io.status != ["200", "OK"]
        puts "No robots.txt!"
      else
        puts "Robots.txt"
        if profile.robotstxt.blank?
          profile.robotstxt = Robotstxt.new(:text => io.read)
        else
          profile.robotstxt.text = io.read
        end
        profile.save
      end
      puts
    end #find_each
  end
end