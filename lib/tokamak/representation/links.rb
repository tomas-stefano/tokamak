module Tokamak
  module Links
    def self.extract_link_header(links)
      links.collect {|link| "<#{link.href}>; rel=#{link.rel}"}.join(', ')
    end
  end
end