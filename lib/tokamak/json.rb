require 'json'

module Tokamak
  module Json
    autoload :Base, 'tokamak/json/base'
    autoload :Builder, 'tokamak/json/builder'
    autoload :Helpers, 'tokamak/json/helpers'
    extend Base::ClassMethods
  end
end
