class String
  def shellescape
    self.gsub(/\s/, '\ ')
  end
  
  def placeholders(values={})
    self.gsub(/:([a-z0-9_-]{1,})/i) { values[$1.to_sym] }
  end
end

class Hash
  def extract(*keys)
    keys.inject({}) { |h,k| h[k] = self[k] if key?(k); h }
  end
end

module Digest
  BLOCK_SIZE = 8192
  
  class MD5
    def self.filedigest(path)
      d = Digest::MD5.new
      File.open(path, 'r') { |f| d.update(f.read(BLOCK_SIZE)) until f.eof? }
      d.hexdigest
    end
  end
  
  class SHA1
    def self.filedigest(path)
      d = Digest::SHA1.new
      File.open(path, 'r') { |f| d.update(f.read(BLOCK_SIZE)) until f.eof? }
      d.hexdigest
    end
  end
end

class File
  def self.get_info(path)
    ext = File.extname(path) ; ext = ext[1..(ext.length-1)]
    name = File.basename(path, File.extname(path))
    return {:filename => name, :extension => ext, :filesize => File.size(path)}
  end
end