module RScale
  extend RScale::UUID
  
  @@config = nil
  @@formats = {}
  
  # Configure RScale
  def self.configure
    @@config = Configuration.new if @@config.nil?
    yield @@config
  end
  
  # Get current RScale configuration
  def self.config
    @@config
  end
  
  # Add new format
  def self.format(name)
    unless @@formats.key?(name)
      @@formats[name] = Format.new(name)
      yield @@formats[name] if block_given?
    else
      raise FormatError, "Format with name [#{name.to_s}] is already defined"
    end
  end
  
  # Get list of formats
  def self.formats
    @@formats
  end
  
  # Generate thumbnails for the image format
  def self.image_for(format, file)
    if @@formats.key?(format.to_sym)
      fmt = @@formats[format.to_sym]
      file_info = File.get_info(file)
      url = fmt.url
      image = {}
      
      options = file_info.merge(:format => fmt.name)
      
      options[:time] = Time.now.to_i unless url[':time'].nil?
      options[:md5] = Digest::MD5.filedigest(file) unless url[':md5'].nil?
      unless url[':uuid'].nil?
        options[:uuid] = uuid
        options[:uuid_dir] = "#{options[:uuid][0,2]}/#{options[:uuid][2,2]}"
      end
      
      fmt.styles.each_pair do |k,v|
        url = fmt.url.placeholders(options.merge(v))
        file_out = @@config.public + "/#{url}"
        if Processor.process(file, file_out, v)
          image[k] = url
        end
      end
      
      return image.size == fmt.styles.size ? image : nil
    else
      raise ArgumentError, "Format #{format.to_s} cannot be found!"
    end
  end
end