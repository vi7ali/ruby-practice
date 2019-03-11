class Node

  attr_accessor :next_node, :value

  def initialize(**opts)
    @value = opts[:value] || nil
    @next_node = opts[:next_node] || nil
  end
end