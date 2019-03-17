require_relative "node.rb"

class LinkedList
  attr_accessor :head, :size

  def initialize
    @head = nil
    @size = 0
  end

  #tail method returns the last element of the list 
  #by checking the .next_node property of the current node
  def tail
    last_node = head
    while last_node.next_node != nil
      last_node = last_node.next_node
    end
    last_node
  end

  #seperate method to create a new node object for
  #optimiztion purpose
  def create_node(value)
    node = Node.new(value)
  end

  #append method addes a new node to the end of the list by getting
  #the last node and assigning the property next_node a new node
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

  #prepend method works by assigning the property next_node of 
  #the new node to head and setting itself as a new head
  def prepend(value)
    new_node = create_node(value)
    new_node.next_node = head
    self.head = new_node
    self.size += 1
  end

  
  def at(index)
    return if size == 0
    node_at = head

    if check_index(index)
      index.times do
        break if node_at.next_node.nil?
        node_at = node_at.next_node
      end
      node_at
    else
      puts "Invalid index"
    end
  end

  def pop
    return if size == 0
    updated_last_node = self.at(size-2)
    updated_last_node.next_node = nil
    self.size -= 1
  end

  def contains?(value)
    size.times do |index|
      current_node = self.at(index)
      return true if current_node.value == value
    end
    false
  end

  def find(value)
    index = nil
    size.times do |idx|
      current_node = self.at(idx)
      if current_node.value == value
        index = idx
        return index
      end
    end
    index
  end

  def to_s
    output = ""
    if size != 0
      size.times do |index|
        current_node = self.at(index)
        output += "( #{current_node.value} ) -> "
      end
      output += "nil"
    end
    output
  end

  def insert_at(index, value)
    return "Invalid index" if !check_index(index)

    new_node = create_node(value)

    if index == 0
      self.prepend(value)
    elsif index == size-1
      self.append(value)
    else
      left_node = at(index-1)
      right_node = at(index)
      left_node.next_node = new_node
      new_node.next_node = right_node
      self.size += 1
    end    
  end

  def remove_at(index)
    return if size == 0
    return "Invalid index" if !check_index(index)

    to_delete = at(index)
    
    if index == size-1
      pop
    elsif index == 0
      self.head = head.next_node
    else      
      left_node = at(index-1)
      right_node = at(index+1)
      left_node.next_node = right_node
      self.size -= 1
    end    
  end

  def check_index(index)
    return index.between?(0,size-1) ? true : false
  end

end