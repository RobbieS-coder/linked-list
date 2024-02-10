class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(item)
    return start_list(item) if empty_list?

    tail.next_node = Node.new(item)
  end

  def tail(node = @head)
    return node if node.next_node.nil?

    tail(node.next_node)
  end

  def empty_list?
    head.nil?
  end

  def start_list(item)
    @head = Node.new(item)
  end
end