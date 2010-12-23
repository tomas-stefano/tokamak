module Tokamak
  module Json
    module Helpers
      def collection(obj, *args, &block)
        Tokamak::Json.to_json(obj, &block)
      end
    
      def member(obj, *args, &block)
        Tokamak::Json.to_json(obj, &block)
      end
    end
  end
end
