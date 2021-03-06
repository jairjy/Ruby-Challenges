# frozen_string_literal: true

# Original challenge: https://repl.it/student/submissions/8643145
# By Jair Jaramillo: https://github.com/jairjy

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

  def get(index, object = @node)
    return object.value if index.zero?

    get(index - 1, object.next_node)
  end
end

list = LinkedList.new

list.add(3)
list.add(5)
puts list.get(1)
