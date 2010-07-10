require 'ftools'

module RScale
  module Processor
    @@sharp_level = [0.5, 0.5]
    @@silent = true
    
    class Convert
      attr_reader :file_from, :file_to
      attr_reader :options
      
      def initialize(file_from, file_to)
        @file_from = File.expand_path(file_from)
        @file_to = File.expand_path(file_to)
        @options = []
        yield self if block_given?
      end
      
      def add(param, value)
        @options << "-#{param.to_s} '#{value}'"
      end
      
      def execute        
        unless File.exists?(File.dirname(@file_to))
          File.makedirs(File.dirname(@file_to)) 
        end
        `convert #{@file_from.shellescape} #{@options.join(' ')} #{@file_to.shellescape} 2>&1`
      end
    end
    
    def self.process(file_in, file_out, opts={})
      src = Geometry.from_file(file_in)      
      dst = Geometry.parse(opts[:size])
      sz = dst.ratio > src.ratio ? "#{dst.width}x" : "x#{dst.height}"
      opts[:crop] = true unless opts.key?(:crop)
      
      convert = Convert.new(file_in, file_out) do |c|
        c.add(:resize, sz)
        c.add(:gravity, 'Center')
        c.add(:crop, "#{dst}+0+0") if opts[:crop]
        c.add(:sharpen, "#{@@sharp_level.first}{#{@@sharp_level.last}}'") if opts.key?(:sharp)
        c.add(:quality, "#{opts[:q]}") if opts.key?(:q)
        c.execute
      end
      return File.exists?(file_out)
    end
  end
end