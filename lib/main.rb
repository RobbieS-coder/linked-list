class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head

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
    return 0 if empty_list?

    current = @head
    counter = 1

    until last_node?(current)
      counter += 1
      current = current.next_node
    end

    counter
  end

  def tail
    return nil if empty_list?

    node = @head

    node = node.next_node until last_node?(node)

    node
  end

  def at(index)
    return nil if empty_list?

    current = @head
    counter = 0

    until counter == index
      return nil if last_node?(current)

      counter += 1
      current = current.next_node
    end

    current.value
  end

  def pop
    current = @head
    previous = nil

    until last_node?(current)
      previous = current
      current = current.next_node
    end

    previous.next_node = nil
  end

  def contains?(value)
    current = @head

    until last_node?(current)
      return true if current.value == value
      current = current.next_node
    end

    false
  end

  def find(value)
    current = @head
    counter = 0

    until last_node?(current)
      return counter if current.value == value
      current = current.next_node
      counter += 1
    end

    nil
  end

  def to_s
    values = []
    current = @head

    while current
      values.push("( #{current.value} )")
      current = current.next_node
    end

    values.join(' -> ') + ' -> nil'
  end

  private

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