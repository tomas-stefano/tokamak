require 'nokogiri'

module Tokamak
  module Representation
  module Atom
    autoload :Factory, 'tokamak/representation/atom/factory'
    autoload :XML, 'tokamak/representation/atom/xml'
    autoload :Base, 'tokamak/representation/atom/base'
    autoload :TagCollection, 'tokamak/representation/atom/tag_collection'
    autoload :Link, 'tokamak/representation/atom/link'
    autoload :Person, 'tokamak/representation/atom/person'
    autoload :Category, 'tokamak/representation/atom/category'
    autoload :Feed, 'tokamak/representation/atom/feed'
    autoload :Entry, 'tokamak/representation/atom/entry'
    autoload :Source, 'tokamak/representation/atom/source'
  end
end
end