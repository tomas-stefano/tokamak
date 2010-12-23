module Tokamak
  # Unknown representation's unmarshalling on the client side
  module Representation
  class Generic

    # Because there is no media type registered, return the content itself
    def unmarshal(content)
      def content.links
        []
      end
      content
    end

    def marshal(string, rel)
      string
    end

  end
end
end