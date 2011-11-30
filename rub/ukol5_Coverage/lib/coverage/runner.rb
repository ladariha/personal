
require_relative 'case'
require_relative 'core'
require_relative 'segment'
require_relative 'reader'

module Coverage
  class Runner
    
    attr_reader :file, :lines
    attr_writer :file, :lines
    
    
    def initialize(f)
      @file = f
    end
    
    def run()
      cases = Coverage::Reader.read(@file)
      i  =0
      cases.each{|test|
        
        i=i+1
        if(i=== cases.length) # no empty line after last output
          segments = Coverage::Core.coverLine(test,true)
        else
          segments = Coverage::Core.coverLine(test,false)
        end  
      }
    end

    
    
  end
end
