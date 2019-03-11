require_relative "node.rb"

class LinkedList
  attr_accessor :head, :size

  def initialize
    @head = nil
    @size = 0
  end

  def create_node(value)
    node = Node.new(value)
  end

  def append(value)
    new_node = create_node(value)    
    if head.nil?
      self.head = new_node
    else
      last_node = tail
      last_node.next_node = new_node
    end
    self.size += 1
  end

  def prepend(value)
    new_node = create_node(value)
    if head.nil?
      self.head = new_node
    else
      new_node.next_node = head
      self.head = new_node
    end
    self.size += 1
  end

  def tail
    last_node = head
    while last_node.next_node != nil
      last_node = last_node.next_node
    end
    last_node
  end

  def at(index)
    node_at = head

    if index.between?(0,size-1)
      index.times do
        break if node_at.next_node.nil?
        node_at = node_at.next_node
      end
      node_at
    else
      puts "Invalid index"
    end
  end

end