class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def append(item)
    return start_list(item) if empty_list?

    tail.next_node = Node.new(item)
  end

  def prepend(item)
    @head = Node.new(item, @head)
  end

  def size
    current = @head
    counter = 1

    until last_node?(current)
      counter += 1
      current = current.next_node
    end

    counter
  end

  private

  def tail
    node = @head

    node = node.next_node until last_node?(node)

    node
  end

  def start_list(item)
    @head = Node.new(item)
  end

  def empty_list?
    @head.nil?
  end

  def last_node?(node)
    node.next_node.nil?
  end
end