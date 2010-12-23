require 'tokamak/xml'
require 'tokamak/json'
require 'tokamak/atom'
require 'tokamak/values'
require 'tokamak/representation'

module Tokamak
  
  # Returns the default root element name for an item or collection
  def self.root_element_for(obj)
    if obj.kind_of?(Hash) && obj.size==1
      obj.keys.first.to_s
    elsif obj.kind_of?(Array) && !obj.empty?
      root_element_for(obj.first).to_s.underscore.pluralize
    else
      obj.class.to_s.underscore
    end
  end
  
end