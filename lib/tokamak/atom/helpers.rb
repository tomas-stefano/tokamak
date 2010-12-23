module Tokamak
  module Atom
    module Helpers
      def collection(obj, *args, &block)
        Tokamak::Atom.to_atom(obj, :atom_type => :feed, &block)
      end
  
      def member(obj, *args, &block)
        Tokamak::Atom.to_atom(obj, :atom_type => :entry, &block)
      end
    end
  end
end
