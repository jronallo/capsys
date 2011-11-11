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
    namespaces = {'cld' => "http://purl.org/cld/terms/", 
      'imlsdccProf' => "http://imlsdcc.grainger.uiuc.edu/profile#",
      'dcterms' => "http://purl.org/dc/terms/",
      'dc' => "http://purl.org/dc/elements/1.1/"
    }
    all_records.flatten!
    all_records.each do |record|
      doc = Nokogiri::XML::Document.parse record.to_s
      profile = {}
      profile[:imlsdcc_identifier] = doc.xpath('//imlsdccProf:collectionDescription/dc:identifier', namespaces).text
      puts profile[:imlsdcc_identifier]
      existing_profile = Profile.find_by_imlsdcc_identifier(profile[:imlsdcc_identifier])
      if existing_profile
        puts "\nAlready created!\n"
      else   
        begin
          profile[:url] =                doc.xpath('//imlsdccProf:collectionDescription/cld:isLocatedAt', namespaces).text
          profile[:description] =        doc.xpath('//imlsdccProf:collectionDescription/dcterms:abstract', namespaces).text
          profile[:name] =               doc.xpath('//imlsdccProf:collectionDescription/dc:title', namespaces).text
          puts Profile.new(profile).save
        rescue
          next
        end
      end
    end
  end #load
end