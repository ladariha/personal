class Graph
  attr_reader :uzly, :pocetUzlu, :operace, :dfsOut
  attr_writer :uzly, :pocetUzlu, :operace, :dfsOut
  def initialize()
    @uzly= Array.new
    @operace = Array.new
    @pocetUzlu = 0;
  end
  
  def addNode(id)
    @uzly.push(id)
  end
  
  def getNode(id)
    @uzly[Integer(id)]
  end
  
  def addOperace(operace)
    @operace.push(operace)
  end
  
  
  def bfs(startNode)
    vystup = "";
    innerBfs(@uzly[startNode-1],vystup)
    
  end
  
  def innerBfs(node,vystup)
   
    node.stav = "opened"
    fronta = Array.new
    fronta.push(node);
    while (fronta.count >0) 
      top = fronta.shift();
      vystup= vystup+top.id.to_s+" "
      top.sousede.each{ |obj|
        if(@uzly[obj-1].stav == "fresh")
          @uzly[obj-1].stav="opened"
          fronta.push(@uzly[obj-1])
        end
      }
      top.stav = "closed"
    end
    
    print vystup
  end
  
   
  def dfs(startNode)
    @dfsOut = ""
    innerDfs(@uzly[startNode-1])
  end
  
  def innerDfs(node)
    @dfsOut = @dfsOut+ node.id.to_s+" "
    node.stav = "opened"
    #        print node.id.to_s+") "
    if(node.sousede.count>0)
      node.sousede.each { |obj|

        #          puts obj.to_s+"|."+@uzly.count.to_s
        if(@uzly[obj-1].stav === "fresh")
          innerDfs(@uzly[obj-1])
        end
          
          
      }
    end
        
    node.stav = "closed"
  end
  
  def performOperation
    @operace.each { |item|
      @uzly.each { |item2|
        item2.stav = "fresh" 
      }
      #       
      if(item.typAlgoritmu === "1")
        bfs(Integer(item.start))
      else
        dfs(Integer(item.start))
        print @dfsOut
      end
      puts ""
    }
  end
  
end

class Uzel
  attr_reader :stav, :id, :sousede
  attr_writer :stav, :id, :sousede
  def initialize(name)
    @id = name
    @sousede = Array.new
    @stav = "fresh"
  end
  
  def addSoused(soused)
    @sousede.push(soused)
  end
  
end

class Operace
  attr_reader :start, :typAlgoritmu
  
  def initialize(start, typ)
    @start = start
    @typAlgoritmu = typ
  end
end




a_string = gets
currentLine = 0
numberOfGraphs = 0
tmp_line = 0;
graphs =Array.new()
graph = Graph.new()


while a_string
  #  puts a_string +" > "+currentLine.to_s
if(currentLine===0)
  numberOfGraphs = Integer(a_string)
  currentLine = 1;
else
  if(currentLine===1)
    graph = Graph.new()
    graph.pocetUzlu = Integer(a_string)
    currentLine = 2
  else
    if(currentLine===2)
      array= a_string.split(' ');
      uzel = Uzel.new((Integer(array[0])))
      somec = 0;
      array.each() { |i|
        if(somec>1)
          uzel.addSoused(Integer(i))
        end  
        somec=somec+1
      }
      graph.addNode(uzel)
      if(graph.uzly.count < graph.pocetUzlu)
        currentLine=2;
      else
        currentLine=3;
      end
    else
      if(currentLine ===3)
        array= a_string.split(' ');
        if(array[0]=== "0" && array[1]==="0")
          graphs.push(graph)
          if(graphs.count === numberOfGraphs)
          else
            currentLine = 1
          end
        else
          operace = Operace.new(array[0], array[1])
          graph.addOperace(operace)
          currentLine=3
        end
      end
    end
  end
  
end
   
  a_string = gets
end

iterator = 1;
graphs.each { |item|
  puts "graph "+iterator.to_s
  item.performOperation()
  iterator = iterator+1
  
}