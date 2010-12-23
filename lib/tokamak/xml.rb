require 'nokogiri'

module Tokamak
  module Xml
    autoload :Base, 'tokamak/xml/base'
    autoload :Builder, 'tokamak/xml/builder'
    autoload :Helpers, 'tokamak/xml/helpers'
    autoload :Links, 'tokamak/xml/links'
    autoload :Link, 'tokamak/xml/link'
    extend Base::ClassMethods
  end
end
