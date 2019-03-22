class Node
  attr_accessor :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = {left: nil, right: nil}    
  end
end

class BinaryTree
  attr_accessor :root, :array_of_nodes

  def initialize
    @root = nil
  end

  def create_node(value)
    Node.new(value)
  end

  def show_tree(node = root, level = 1)    
    return if node == nil
    puts "Level - " + level.to_s + " Value - " + node.value.to_s 
    show_tree(node.children[:left], level += 1)
    show_tree(node.children[:right], level)
  end

  def build_tree(array)
    array.each do |value|
      if root.nil?
        self.root = create_node(value)
      else
        place_node(value)
      end
    end
  end

  def place_node(value, parent=root)
    node = create_node(value)
    if value <= parent.value
      if parent.children[:left].nil?
        node.parent = parent
        parent.children[:left] = node        
      else
        place_node(value, parent.children[:left])
      end
    else
      if parent.children[:right].nil?
        node.parent = parent
        parent.children[:right] = node        
      else        
        place_node(value, parent.children[:right])
      end
    end
  end


  def breadth_first_search(value)
    queue = []

    if root.nil?
      return "Tree is empty"
    else
      current_node = root
      queue.push(current_node)
      while (!queue.empty?)
        queue.push(current_node.children[:left]) if !current_node.children[:left].nil?
        queue.push(current_node.children[:right]) if !current_node.children[:right].nil?
        if current_node.value == value
          return "Found - #{current_node.value} in #{current_node}"
        else
          queue.shift
          current_node = queue[0]
        end
      end
      return "Value not found"
    end
  end

  def depth_first_search(value)
    stack = []

    if root.nil?
      return "Tree is empty"
    else
      current_node = root
      stack.push(current_node)
      while (!stack.empty?)
        if current_node.value == value
          return "Found - #{current_node.value} in #{current_node}"
        else
          current_node = stack.last
          stack.pop          
        end
        stack.push(current_node.children[:left]) if !current_node.children[:left].nil?
        stack.push(current_node.children[:right]) if !current_node.children[:right].nil?        
      end
      return "Value not found"
    end
  end
end