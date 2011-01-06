module RScale
  class Format
    attr_reader :name
    attr_accessor :styles, :url
    
    def initialize(name)
      @name = name.to_s
      @styles = {}
      @url = '/:format/:style/:uuid_dir/:uuid.:extension'
    end
    
    # Add a new style
    def style(name, opts={})
      raise FormatError, 'Options required!' if opts.empty?
      raise FormatError, 'Options must be a Hash!' unless opts.kind_of?(Hash)
      opts[:style] = name
      @styles[name] = opts
    end
  end
end