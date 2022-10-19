# frozen_string_literal: true

require_relative './node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if head.nil?
      @head = Node.new(value, nil)
    else
      last_node = @head
      last_node = last_node.next_node until last_node.next_node.nil?
      last_node.next_node = Node.new(value, nil)
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
    current_node = current_node.next_node until current_node.next_node.nil?
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

    if @head.next_node.nil?
      removed = @head
      @next_node = nil
      return removed
    end

    current_node = @head
    loop do
      break if current_node.next_node.next_node.nil?

      current_node = current_node.next_node
    end
    removed = current_node.next_node
    current_node.next_node = nil
    removed
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
      if current_node.value == value
        return true
      else
        current_node = current_node.next_node
      end
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0
    found = false
    until current_node.nil?
      found = true if current_node.value == value
      current_node = current_node.next_node
      index += 1 unless found
    end
    index if found
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
  end

  def insert_at(value, index)
    return puts 'Index is larger than list size' if index > size

    if index.zero?
      prepend(value)
    else
      new_node = Node.new(value, at(index))
      prev_node = at(index - 1)
      prev_node.next_node = new_node
    end
  end

  def remove_at(index)
    return puts 'Index is larger than list size' if (index + 1) > size

    if index == size
      pop
    elsif index.zero?
      @head = at(1)
    else
      prev_node = at(index - 1)
      prev_node.next_node = at(index + 1)
    end
  end
end
