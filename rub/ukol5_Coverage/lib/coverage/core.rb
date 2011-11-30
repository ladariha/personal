
class Array
  def bubblesortSegments!
    length.times do |j|
      for i in 1...(length - j)
        if self[i].left < self[i - 1].left
          self[i], self[i - 1] = self[i - 1], self[i]
        else
          if self[i].left === self[i-1].left
            if self[i].right < self[i - 1].right
              self[i-1], self[i] = self[i - 1], self[i]
            else
              self[i], self[i-1] = self[i - 1], self[i]
            end
          end
        end
      end
      self
    end
  end
end

module Coverage
  class Core

    def self.coverLine(test, posledni)
      # sort fragments
      test.segments.bubblesortSegments!
      solution = Array.new
      currentLeft = 0
      nalezen = 0;
      leftcandidate = test.segments[0]
      ite = 0
      while currentLeft < test.m #&& ite <1000
        ite = ite+1
        nalezen =0;
        test.segments.each{ |seg|
          if(seg.left <= currentLeft && seg.right >= leftcandidate.right && seg.used===0)
            nalezen = 1;
            leftcandidate = seg
            
          end
        }
        leftcandidate.used=1
        currentLeft = leftcandidate.right;

        
        # no possible fragment found and line is still not covered => no solution
        if(nalezen===0) 
          puts "0"
          if(!posledni)
            puts ""  
          end
          return solution
        end
        
      end
      
      # count used fragments
      celkem = 0
      test.segments.each{ |seg|
        if(seg.used===1)
          celkem = celkem+1
        end
      }
      puts celkem.to_s
      
      # print used fragments
      test.segments.each{ |seg|
        if(seg.used===1)
          solution.push(seg)
          puts seg.to_s
        end
      }
      
      # if it is neccessary to print empty line
      if(!posledni)
        puts ""  
      end
      return solution
    end
  end
end
