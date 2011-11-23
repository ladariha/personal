# To change this template, choose Tools | Templates
# and open the template in the editor.

class Rectangle
    
  attr_reader :side_length,:center_x, :center_y, :left_x, :right_x, :down_y, :upper_y
  attr_writer :side_length,:center_x, :center_y, :left_x, :right_x, :down_y, :upper_y
    
  def initialize (x, y, s)
    @side_length = Float(s)
    @center_x= Float(x)
    @center_y = Float(y)
    
    calculateCoords()
    
  end
  
  def calculateCoords()
    @left_x = @center_x  - @side_length/2
    @right_x = @center_x  + @side_length/2
    
    @down_y = @center_y - @side_length/2
    @upper_y = @center_y + @side_length/2
  end
end
