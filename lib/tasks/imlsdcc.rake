namespace :imlsdcc do
  desc 'load IMLS DCC OAI-PMH harvested collection data'
  task :load => :environment do 
    client = OAI::Client.new 'http://imlsdcc.grainger.uiuc.edu/registry/oai/oai.aspx'
    all_records = []
    records = client.list_records(:metadata_prefix => 'imlsdcc')
    all_records << records.map{|record| record.metadata}
    while records.resumption_token != nil  
      records = client.list_records(:resumption_token => records.resumption_token)
      all_records << records.map{|record| record.metadata}
      all_records.flatten!
      puts all_records.length
    end
    all_records.flatten!
    
    all_records.each_with_index do |record, index|
      puts index
      imls_profile = Capsys::ImlsdccProfile.new(record.to_s)
      
      existing_profile = Profile.find_by_imlsdcc_identifier(imls_profile.identifier)
      if existing_profile 
        if !ENV['UPDATEPROFILE']
          puts "\nAlready created!\n"
        else
          existing_profile.update_attributes(imls_profile.profile)
          puts existing_profile.save
        end
      else   
        begin
          puts Profile.new(imls_profile.profile).save
        rescue
          next
        end
      end
      puts
    end #each
  end #load
end