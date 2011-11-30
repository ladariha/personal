# To change this template, choose Tools | Templates
# and open the template in the editor.

class Point
  attr_reader :x,:y
  attr_writer :x,:y
  def initialize(x,y)
    @x = x
    @y = y
  end
  
  def == (o)
    if(o.class == self.class)
      if(@x == o.x && @y==o.y)
        return true
      end
      return false
    end
    return false
  end
end
