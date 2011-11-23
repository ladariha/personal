module Decipher
  class Core

    def self.decode(lines)
      outer_iterator = 0
      lines.each{ |i|
        iterator = 0
        i.each_byte { |ascii|
        if(ascii >= 7)
          ascii = ascii-7
        else
          # 127 is max value of ascii
          ascii = 127 - (6-ascii)
        end
          i[iterator]=ascii.chr
          iterator = iterator+1
          
        }
        puts i
        lines[outer_iterator] = i
        outer_iterator = outer_iterator+1
      }
      return lines
    end
    
  end
end
