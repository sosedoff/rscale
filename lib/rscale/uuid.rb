module RScale
  module UUID
    # Generate uuid based on current configuration
    def uuid
      RScale.config.uuid_system ? uuid_system : uuid_local
    end
    
    # Generate pseudo-unique string if local system does not have uuid binary installed
    def uuid_local
      values = [
        rand(0x0010000), rand(0x0010000),
        rand(0x0010000), rand(0x0010000),
        rand(0x0010000), rand(0x1000000),
        rand(0x1000000),
      ]
      "%04x%04x%04x%04x%04x%06x%06x" % values
    end
    
    # Generate uuid using system binary
    def uuid_system
      `uuidgen`.strip.gsub(/-/,'')
    end
  end
end