module RScale::Processor
  class Geometry
    attr_reader :width, :height
    
    def initialize(w, h) ; @width = w ; @height = h ; end
    def square? ; width == height ; end
    def horizontal? ; width > height ; end
    def vertical? ; width < height ; end
    def ratio ; width / height ; end
    def to_s ; "#{width}x#{height}" ; end
    def to_crop_resize ; horizontal? ? "#{width}x" : "x#{height}" ; end
        
    # parse dimensions from WxH string (W - width, H - height)
    def self.parse(str)
      sz = str.split('x').collect { |v| v.to_i }
      Geometry.new(sz[0], sz[1])
    end
  
    # parse geomerty from file using imagemagick identify command  
    def self.from_file(file)
      Geometry.parse(`identify -format %wx%h #{file}`.strip) 
    end
  end
end