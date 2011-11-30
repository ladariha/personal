# To change this template, choose Tools | Templates
# and open the template in the editor.

module Coverage
  class Case
    
    attr_reader :m,:segments
    attr_writer  :m,:segments
    
    def initialize (m)
      # integeres sucks :)
      @m = m
      @segments = Array.new
    end
  
    def addSegment(s)
      @segments.push(s)
    end
   
  end
end
