# To change this template, choose Tools | Templates
# and open the template in the editor.

require './rectangle'
puts "Rectangles"


require '../lib/rectangles/runner'
runner = Rectangles::Runner.new()
runner.run()

puts "==="
#
#x1 = 0
#y1 = 0
#a1 = 44
#rec1 = Rectangle.new(x1, y1, a1)4
#x2 = 0
#y2 = 0
#a2 = 3
#rec2 = Rectangle.new(x2, y2, a2)
#
#
#
#def isoverlapping(r1, r2)
#
#  if(r2.left_x > r1.right_x)
#    return false
#  end
#  
#  if(r2.right_x < r1.left_x)
#    return false
#  end
#  
#  if(r2.down_y > r1.upper_y)
#    return false
#  end
#  if(r2.upper_y < r1.down_y)
#    return false
#  end
#  
#  return true
#
#  
#end
#
#def min(a,b)
#  if(a<b)
#    return a
#  end
#  return b
#end
#
#def max(a,b)
#  if(a>b)
#    return a
#  end
#  return b
#end
#
#puts "==="
#  
#if(isoverlapping(rec1, rec2))
#  x_overlap = min( rec1.right_x, rec2.right_x )-max(rec1.left_x, rec2.left_x )
#  y_overlap = min( rec1.upper_y, rec2.upper_y)-max( rec2.down_y, rec1.down_y)
#  overlap = x_overlap*y_overlap
#  puts overlap
#  tog = (a1*a1)+(a2*a2) - overlap
#  puts tog
#  
#end

