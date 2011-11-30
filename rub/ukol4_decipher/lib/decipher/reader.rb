module Decipher
  class Reader
    attr_reader :lines
    attr_writer :lines
    
    
    def initialize(file_name)
      if(file_name.length  === 0)
        raise ArgumentError, "Empty argument"
      end
      if(File.exist?(file_name))
        @lines = IO.readlines(file_name)
      else
        raise IOError , "File not found"
      end
    end
    
    def print
      puts @lines
    end
    
  end
end


  
