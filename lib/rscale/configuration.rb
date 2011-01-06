module RScale
  class Configuration
    attr_accessor :root
    attr_accessor :public
    attr_accessor :uuid_system
    
    def initialize(root=nil, public=nil)
      @root = root || File.dirname(__FILE__)
      @public = public || @root + '/public'
      @uuid_system = !`which uuid-gen`.to_s.strip.empty?
    end
  end
end