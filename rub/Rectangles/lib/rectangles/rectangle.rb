# To change this template, choose Tools | Templates
# and open the template in the editor.

require_relative 'point'

module Rectangles
  class Rectangle
    
    attr_reader :side_length,:center_x, :center_y, :left_x, :right_x, :down_y, :upper_y
    attr_writer :side_length,:center_x, :center_y, :left_x, :right_x, :down_y, :upper_y
    
    def initialize (x, y, s)
      # integeres sucks :)
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
    
    def istouching(rec2)
      
      p1 = Point.new(@left_x, @down_y)
      p2 = Point.new(@right_x, @down_y)
      p3 = Point.new(@right_x, @upper_y)
      p4 = Point.new(@left_x, @upper_y)
      
      rec1_points = Array[p1,p2,p3,p4]
      
      p5 = Point.new(rec2.left_x, rec2.down_y)
      p6 = Point.new(rec2.right_x, rec2.down_y)
      p7 = Point.new(rec2.right_x, rec2.upper_y)
      p8 = Point.new(rec2.left_x, rec2.upper_y)
      
      rec2_points = Array[p5,p6,p7,p8]
      
      rec1_points.each { |point|
        rec2_points.each{ |point2|
          if(point == point2)
            return true
          end
        }
      }
      return false
    end
  end
end
