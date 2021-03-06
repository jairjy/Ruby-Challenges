# frozen_string_literal: true

# Original challenge: https://repl.it/student/submissions/8663324
# By Jair Jaramillo:  https://github.com/jairjy

# Start with your code from LinkedList challenge.

# Creates a Node object containing a number and a slot for another node
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# Creates a Stack linked list
class Stack
  def empty?
    @node.nil?
  end

  def push(number)
    if empty?
      @node = Node.new(number)
    else
      temp = Node.new(@node.value, @node.next_node)
      @node.value = number
      @node.next_node = temp
    end
  end

  def pop
    val = @node.value
    @node = @node.next_node
    val
  end

  def min(object = @node, compi = @node.value)
    compi = object.value if object.value < compi
    min(object.next_node, compi) unless object.next_node.nil?
    compi
  end
end

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.min
# => 3

stack.pop
stack.push(7)
puts stack.min
# => 3

stack.push(2)
puts stack.min
# => 2

stack.pop
puts stack.min
# => 3
