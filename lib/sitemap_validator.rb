require 'net/http'
require 'nokogiri'

class SitemapValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    configuration = {:message => "is invalid"}
    configuration.update(options)
    
    uri = URI(value)
    xml = Net::HTTP.get(uri)    
    if xml.include?('<sitemapindex')
      xsd = Nokogiri::XML::Schema(File.read(File.join(Rails.root, 'lib', 'xsd', 'siteindex.xsd')))
    else
      xsd = Nokogiri::XML::Schema(File.read(File.join(Rails.root, 'lib', 'xsd', 'sitemap.xsd')))
    end
    doc = Nokogiri::XML(xml)
    
    errors = xsd.validate(doc)
    
    if errors.blank?
      object.valid_sitemap = true
      return true
    else
      errors.each do |error|
        object.errors.add(attribute, error.message)
      end
      return false
    end
    
    # .each do |error|
    #   puts error.message
    # end    
    
  end
end