module RScale
  class Configuration
    attr_accessor :root
    attr_accessor :public
    
    def initialize(root=nil, public=nil)
      @root = root || File.dirname(__FILE__)
      @public = public || @root + '/public'
    end
  end
end