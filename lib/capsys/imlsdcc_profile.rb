module Capsys
  class ImlsdccProfile
    attr_accessor :doc, :identifier
    
    def initialize(xml)
      @doc = Nokogiri::XML::Document.parse xml
      @identifier = @doc.xpath('//imlsdccProf:collectionDescription/dc:identifier', namespaces).text
    end
    
    def profile
      fields = {}
      fields[:imlsdcc_identifier] = @identifier
      fields[:url] =         @doc.xpath('//imlsdccProf:collectionDescription/cld:isLocatedAt', namespaces).text
      fields[:description] = @doc.xpath('//imlsdccProf:collectionDescription/dcterms:abstract', namespaces).text
      fields[:name] =        @doc.xpath('//imlsdccProf:collectionDescription/dc:title', namespaces).text
      categories =           @doc.xpath('//imlsdccProf:collectionDescription/dc:subject[@xsi:type="imlsdcc:GEM"]',namespaces)
      fields[:categories] = categories.map{|node| node.text.split('--').first}.uniq.sort
      fields
    end
    
    def vcard
      vcard_xml = @doc.xpath('//vcard:VCARD/vcard:ADR/..', namespaces)
      fields = []
      vcard_xml.xpath('*').each do |child|
        puts child.name
      end
      fields
    end
    
    protected
    
    def namespaces
      {'cld' => "http://purl.org/cld/terms/", 
      'imlsdccProf' => "http://imlsdcc.grainger.uiuc.edu/profile#",
      'dcterms' => "http://purl.org/dc/terms/",
      'dc' => "http://purl.org/dc/elements/1.1/",
      'xsi'=>"http://www.w3.org/2001/XMLSchema-instance",
      'vcard' => 'http://www.w3.org/2001/vcard-rdf/3.0#'
    }
    end
  end
end