module Tokamak
  module Representation
    module Atom
      class XML
        attr_accessor :doc
    
        def initialize(xml_obj = nil)
          if xml_obj
            xml_obj.kind_of?(Nokogiri::XML::Document) ? @doc = xml_obj.root : @doc = xml_obj
          else
            @doc    = Nokogiri::XML::Document.new
            root_node = @doc.create_element(atom_type.to_s)
            root_node.add_namespace_definition(nil, "http://www.w3.org/2005/Atom")
            root_node.parent = @doc
            @doc = @doc.root
          end
        end
      
        # Tools
        def css(*args)
          @doc.css(*args)
        end
    
        def xpath(*args)
          @doc.xpath(*args)
        end
  
        def atom_type
          self.class.name.demodulize.downcase
        end
  
        def to_xml
          @doc.to_xml
        end
    
        def to_s
          to_xml
        end

        def method_missing(method, *args, &block)
          text(method) || super
        end

      protected 
  
        def text(node_name)
          (node = @doc.at_xpath("xmlns:#{node_name}")) ? node.content : nil
        end
  
        def set_text(node_name, value)
          if (node = @doc.at_xpath("xmlns:#{node_name}"))
            value = value.xmlschema if value.kind_of?(Time) || value.kind_of?(DateTime)
            node.content = value
          else
            node = create_element(node_name, value)
            node.parent = @doc
          end
        end
  
      private
  
        def create_element(node, *args)
          node = @doc.document.create_element(node) do |n|
            args.each do |arg|
              include_arg n, arg
            end
          end
        end
      
        def include_arg(n, arg)
          case arg
          when Hash
            # Adding XML attributes
            arg.each { |k,v|
              key = k.to_s
              if key =~ /^xmlns(:\w+)?$/
                ns_name = key.split(":", 2)[1]
                n.add_namespace_definition(ns_name, v)
                return
              end
              n[k.to_s] = v.to_s
            }
          else            
            # Adding XML node content
            arg.kind_of?(Time) || arg.kind_of?(DateTime) ? content = arg.xmlschema : content = arg
            n.content = content
          end
        end
      
      
      end
    end
  end
end