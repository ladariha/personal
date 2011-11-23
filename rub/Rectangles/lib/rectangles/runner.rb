
require_relative 'core'

module Rectangles
  class Runner
    
    def initialize()
      
    end
    
    def run()
      
      print "Zadejte delku hrany prvniho ctverce:"
      begin
        a1 =   Float(gets)
        if(a1 < 0)
          print "Spatny vstup"
          exit
        end
      rescue
        print "Spatny vstup"
        exit
      end
        
      print "Zadejte x-ovou souradnici stredu prvniho ctverce:"
      begin
        x1 =  Float(gets)
      rescue
        print "Spatny vstup"
        exit
      end
      
      print "Zadejte y-ovou souradnici stredu prvniho ctverce:"
      begin
        y1 =   Float(gets)
      rescue
        print "Spatny vstup"
        exit
      end
      
      print "Zadejte delku hrany druheho ctverce:"
      begin
        a2 =  Float(gets)
        if(a2 < 0)
          print "Spatny vstup"
          exit
        end
      rescue
        print "Spatny vstup"
        exit
      end
      
      print "Zadejte x-ovou souradnici stredu druheho ctverce:"
      begin
        x2 =   Float(gets)
      rescue
        print "Spatny vstup"
        exit
      end
      
      print "Zadejte y-ovou souradnici stredu druheho ctverce:"
      begin
        y2 =  Float(gets)
      rescue
        print "Spatny vstup"
        exit
      end

      rec1 = Rectangle.new(x1, y1, a1)
      rec2 = Rectangle.new(x2, y2, a2)
      Rectangles::Core.computeJoint(rec1, rec2)
      
      
    end

    
  end
end
