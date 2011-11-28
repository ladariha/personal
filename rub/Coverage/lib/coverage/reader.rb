# To change this template, choose Tools | Templates
# and open the template in the editor.

module Coverage
  class Reader
    def self.read(file)
        if(file.length  === 0)
        raise ArgumentError, "Empty argument"
      end
      if(File.exist?(file))
        lines = IO.readlines(file)
      else
        raise IOError , "File not found"
      end
      
      #      parse data
      outer_iterator = 0
      numberOfTests = 0
      checkedTests=-1
      cases = Array.new
      c = Coverage::Case.new(0)
      lines.each{ 
        |i|
        begin
        case outer_iterator
        when 0
          numberOfTests = Integer(i)
        when 1
          # should be blank
          if /\S/ !~ i # new line char
          else
            exit
          end
        when 2
          # M
          if /\S/ !~ i
          else
            c = Coverage::Case.new(Integer(i))
            checkedTests = checkedTests+1;
          end
          
        when 3
          # Li Ri or 0 0 
          array= i.split(' ');
          if(array[0]=== "0" && array[1]==="0")
            cases.push(c)
            outer_iterator = 0
          else
            c.addSegment(Coverage::Segment.new(array[0], array[1]))
            outer_iterator=2
          end
        end
        outer_iterator = outer_iterator+1
        rescue Exception => e
          raise ArgumentError, "Invalid input file"
        end
      }
      return cases
      
    end
  end
end
