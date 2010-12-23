module Tokamak
  module Representation
  class Json
    autoload :Base, 'tokamak/representation/json/base' 
    autoload :KeysAsMethods, 'tokamak/representation/json/keys_as_methods' 
    autoload :Link, 'tokamak/representation/json/link' 
    autoload :LinkCollection, 'tokamak/representation/json/link_collection' 
    extend Base::ClassMethods
  end
end
end