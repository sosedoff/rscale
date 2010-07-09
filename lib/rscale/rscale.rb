module RScale
  @@config = nil
  @@formats = {}
  
  def self.configure
    @@config = Configuration.new if @@config.nil?
    yield @@config
  end
  
  def self.format(name)
    unless @@formats.key?(name)
      @@formats[name] = Format.new(name)
      yield @@formats[name] if block_given?
    else
      raise FormatError, "Format with name [#{name.to_s}] is already defined"
    end
  end
  
  def self.formats
    @@formats
  end
  
  def self.image_for(format, file)
    if @@formats.key?(format.to_sym)
      fmt = @@formats[format.to_sym]
      file_info = File.get_info(file)
      image = {}
      
      options = file_info.merge(:format => fmt.name)
      
      fmt.styles.each_pair do |k,v|
        url = fmt.url.placeholders(options.merge(v))
        file_out = @@config.public + "/#{url}"
        image[k] = Processor.process(file, file_out, v)
      end
    else
      raise ArgumentError, "Format #{format.to_s} cannot be found!"
    end
  end
end