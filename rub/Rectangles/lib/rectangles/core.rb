module Rectangles
  class Core

    def self.computeJoint(rec1, rec2)
      if(isoverlapping(rec1, rec2))
        x_overlap = min( rec1.right_x, rec2.right_x )-max(rec1.left_x, rec2.left_x )
        y_overlap = min( rec1.upper_y, rec2.upper_y)-max( rec2.down_y, rec1.down_y)
        overlap = x_overlap*y_overlap
        tog = (rec1.right_x - rec1.left_x)*(rec1.right_x - rec1.left_x)+(rec2.right_x - rec2.left_x)*(rec2.right_x - rec2.left_x) - overlap
        print "Obsah sjednoceni dvou ctvercu je "+tog.to_s
      else
        if(rec1.istouching(rec2))
          
        else
          print "Ctverce se ani nedotykaji"
        end

      end
    end
    

    
    def self.isoverlapping(r1, r2)

      if(r2.left_x > r1.right_x)
        return false
      end
  
      if(r2.right_x < r1.left_x)
        return false
      end
  
      if(r2.down_y > r1.upper_y)
        return false
      end
      if(r2.upper_y < r1.down_y)
        return false
      end
  
      return true

  
    end

    def self.min(a,b)
      if(a<b)
        return a
      end
      return b
    end

    def self.max(a,b)
      if(a>b)
        return a
      end
      return b
    end
    
  end
end
