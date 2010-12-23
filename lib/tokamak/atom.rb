module Tokamak
  module Atom
    autoload :Base, 'tokamak/atom/base'
    autoload :Builder, 'tokamak/atom/builder'
    autoload :Helpers, 'tokamak/atom/helpers'
    extend Base::ClassMethods
  end
end