# To change this template, choose Tools | Templates
# and open the template in the editor.

module Coverage
  class Segment
    attr_reader :left,:right, :used
    attr_writer  :left,:right, :used
    
    def initialize (x, y)
      @left = Integer(x)
      @right= Integer(y)
      @used=0
    end
    
    def to_s
      @left.to_s+" "+@right.to_s
    end
    
  end

end