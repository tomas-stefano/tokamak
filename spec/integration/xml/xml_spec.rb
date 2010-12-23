require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

class SimpleClass
  attr_accessor :id, :title, :updated
  def initialize(id,title,updated)
    @id, @title, @updated = id, title, updated
  end
end

class Item
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

describe Tokamak do
  describe 'Xml' do
  
    describe "pure to_xml method" do
      
      it "should use a default recipe extracting first root element that serializes an entire object if responds to to_xml" do
        time = Time.now
        an_article = {:article => {:id => 1, :title => "a great article", :updated => time}}
        
        entry = to_xml(an_article)
        entry.should == an_article[:article].to_xml(:root => "article")
      end

      it "should use a default recipe that serializes an entire object if responds to to_xml" do
        time = Time.now
        an_article = {:id => 1, :title => "a great article", :updated => time}
        
        entry = to_xml(an_article)
        entry.should == an_article.to_xml
      end
    
    end
      
    describe "entry dsl" do
      
      it "should create an entry from builder DSL" do
        an_article = {:article => {:id => 1, :title => "a great article"}}

        entry = to_xml(an_article) do |member, article|
          member.values do |values|
            values.id      "uri:#{article[:article][:id]}"            
            values.title   article[:article][:title]
          end

          member.link("image", "http://example.com/image/1")
          member.link("image", "http://example.com/image/2", :type => "application/atom+xml")                                
        end

        entry = Hash.from_xml entry
        entry["article"]["id"].should == "uri:1"
        entry["article"]["title"].should == "a great article"
      end
    
    end
    it 'should y' do
      execute {
        puts "invoking"
        # collection([Object.new]) do |col|
        # end
      }
    end
  
    def execute(&block)
      where = Object.new.extend(Tokamak::Xml::Helpers)
      where.instance_eval &block
    end
  
  end
  
  def to_xml(*args, &recipe)
    Tokamak::Xml.to_xml(*args, &recipe)
  end
  
  def describe_recipe(*args, &recipe)
    Tokamak::Xml.describe_recipe(*args, &recipe)
  end
  
  def simple_object(*args)
    SimpleClass.new(*args)
  end

end

  # 
  #   describe "Feed" do
  #     it "should create a feed from builder DSL" do
  #       time = Time.now
  #       some_articles = {:some_articles => [
  #         {:id => 1, :title => "a great article", :updated => time},
  #         {:id => 2, :title => "another great article", :updated => time}
  #       ]}
  #       
  #       feed = to_xml(some_articles) do |collection|
  #         collection.values do |values|
  #           values.id      "http://example.com/feed"
  #           values.title   "Feed"
  #           values.updated time
  #           
  #           values.authors {
  #             values.author { 
  #               values.name  "John Doe"
  #               values.email "joedoe@example.com"
  #             }
  #             values.author { 
  #               values.name  "Foo Bar"
  #               values.email "foobar@example.com"
  #             }
  #           }
  #         end
  #         
  #         collection.link("next", "http://a.link.com/next")
  #         collection.link("previous", "http://a.link.com/previous")
  #         
  #       end
  #       
  #       feed = Hash.from_xml feed
  #       feed["some_articles"]["id"].should == "http://example.com/feed"
  #       feed["some_articles"]["title"].should == "Feed"
  #       # feed["updated"].should == DateTime.parse(time.xmlschema)
  #       feed.some_articles.authors.author.first["name"].should == "John Doe"
  #       feed.some_articles.authors.author.last["email"].should == "foobar@example.com"
  #       
  #    end
  # 
  #     it "should pluralize items on root and singularize on element" do
  #       time = Time.now
  #       some_articles = [Item.new("training"), Item.new("books")]
  #       
  #       feed = to_xml(some_articles) do |collection|
  #         collection.values do |values|
  #           collection.members do |member, item|
  #           end
  #         end
  #       end
  #       
  #       feed = Hash.from_xml feed
  #       feed.keys.first.should =="items"
  #       feed.items.keys.first.should =="item"
  #       # feed.items.item[0].name.should == "training"
  #       # feed.items.item[1].name.should == "books"
  #       
  #    end
  # 
  #   end
  # 


  # 
  #     it "should be able to declare links inside values block" do
  #       an_article = {:article => {:id => 1, :title => "a great article"}}
  #       
  #       entry = to_xml(an_article) do |member, article|
  #         member.values do |values|
  #           values.id      "uri:#{article[:article][:id]}"            
  #           values.title   article[:article][:title]
  # 
  #           values.domain("xmlns" => "http://a.namespace.com") {
  #             member.link("image", "http://example.com/image/1")
  #             member.link("image", "http://example.com/image/2", :type => "application/atom+xml")
  #           }
  #         end
  #         
  #       end
  #       
  #       entry = Hash.from_xml entry
  #       entry["article"]["id"].should == "uri:1"
  #       entry["article"]["title"].should == "a great article"
  #       entry.article.domain.links.image.should_not be_nil
  #       entry.article.domain.links.non_existant.should be_nil
  #     end
  #     
  #     it "should create an entry from an already declared recipe" do
  #       describe_recipe(:simple_entry) do |member, article|
  #         member.values do |values|
  #           values.id      "uri:#{article[:article][:id]}"            
  #           values.title   article[:article][:title]
  #           values.updated article[:article][:updated]
  #         end
  #         
  #         member.link("image", "http://example.com/image/1")
  #         member.link("image", "http://example.com/image/2", :type => "application/atom+xml")                                
  #       end
  #      
  #       time = Time.now
  #       an_article = {:article => {:id => 1, :title => "a great article", :updated => time}}
  #       
  #       entry = to_xml(an_article, :atom_type => :entry, :recipe => :simple_entry)
  #       
  #       entry = Hash.from_xml entry
  #       entry["article"]["id"].should == "uri:1"
  #       entry.article.title.should == "a great article"
  #       # entry.updated.should == DateTime.parse(time.xmlschema)
  #     end
  #   
  #   end
  #   
  # end
  # 

# end
