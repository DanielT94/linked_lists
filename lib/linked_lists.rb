require_relative './node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if (head.nil?)
      @head = Node.new(value, nil)
    else
      current_node = @head
      while (!current_node.next_node.nil?)
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(value, nil)
    end
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size
    counter = 0
    current_node = @head
    until current_node.nil?
      counter += 1
      current_node = current_node.next_node
    end
    counter
  end

  def tail(current_node = @head)
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node
  end

  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def pop
    return if @head.nil?
    current_node = @head
    until current_node = current_node.tail
      current_node = current_node.next_node
    current_node.next_node = nil
    current_node.tail = current_node
    end
  end

end