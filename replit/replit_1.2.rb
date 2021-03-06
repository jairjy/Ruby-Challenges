# frozen_string_literal: true

# Original challenge: https://repl.it/student/submissions/8567292
# By Jair Jaramillo:  https://github.com/jairjy

# Creates a Node object containing a number and a slot for another node
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# Creates an empty linked list
class LinkedList
  def initialize
    @node = Node.new(nil)
  end

  def add(number, object = @node)
    if object.value.nil?
      object.value = number
    elsif !object.next_node.nil?
      add(number, object.next_node)
    else
      object.next_node = Node.new(number)
    end
  end

  def add_at(index, number, object = @node)
    if index.zero?
      temp = Node.new(object.value, object.next_node)
      object.value = number
      object.next_node = temp
    else
      add_at(index - 1, number, object.next_node)
    end
  end

  def remove(index, object = @node)
    if (index - 1).negative?
      @node = @node.next_node
    elsif !(index - 1).zero?
      remove(index - 1, object.next_node)
    else
      object.next_node = object.next_node.next_node
    end
  end

  def get(index, object = @node)
    return object.value if index.zero?

    get(index - 1, object.next_node)
  end

  private

  def get_node(index, object = @node)
    return object if index.zero?

    get(index - 1, object.next_node)
  end
end

list = LinkedList.new

list.add(3)
list.add(5)
list.add_at(1, 11)
list.add_at(0, 13)

puts list.get(2)
# => 11

puts list.get(3)
# => 5
