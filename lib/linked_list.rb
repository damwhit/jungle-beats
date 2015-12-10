require_relative 'node'
require 'pry'

class LinkedList
	attr_accessor :head

	def initialize(value = nil)
    @head = Node.new(value)
		@value = value
	end

	def tail
		current_node = @head
		until current_node.next_node == nil
			current_node = current_node.next_node
		end
		current_node
	end

	def append(value)
		new_node = Node.new(value)
		tail.next_node = new_node
	end

	def prepend(value)
		current_node = @head
		@head = Node.new(value)
		@head.next_node = current_node
	end

	def count
	current_node = @head
	count = 1
	until current_node.next_node == nil
		current_node = current_node.next_node
		count += 1
		end
		count
	end

	def all
		current_node = @head
		beats = []
		until current_node == nil
			beats << current_node.value + " "
			current_node = current_node.next_node
		end
		beats.join.chop
	end

	def pop(n = 1)
		popped = []
		n.times do
		current_node = @head
		until current_node.next_node.next_node == nil
			current_node = current_node.next_node
		end
			popped << current_node.next_node.value + " "
			current_node.next_node = nil
		end
		popped.reverse.join.chop
	end

	def find(position, n)
		current_node = @head
		count = 0
		until count == position
			count += 1
			current_node = current_node.next_node
		end

		beats = ""
		n.times do
			beats << current_node.value + " "
			current_node = current_node.next_node
		end
		beats.chop
	end

	def insert(position, value)
		node = Node.new(value)
		current_node = @head
		count = 0
		until count == position
			count += 1
			current_node = current_node.next_node
		end
			node.next_node = current_node

			count = 0
			current_node = @head
		until count == position -1
			count += 1
			current_node = current_node.next_node
		end
			current_node.next_node = node
			all
	end


	def include?(beat)
		current_node = @head
		until current_node == nil
		return true if current_node.value == beat
		current_node = current_node.next_node
		end
			false
	end
end
