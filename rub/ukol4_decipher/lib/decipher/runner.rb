require_relative 'reader'
require_relative 'core'

module Decipher
  class Runner

    attr_reader :file
    attr_writer :file
    
    def initialize(file)
      @file = file
    end
    
    def run
      reader = Decipher::Reader.new(@file)
      Decipher::Core.decode(reader.lines)
    end
  end
end
