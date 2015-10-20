require_relative 'node'
require 'pry'

class JungleBeat
  attr_accessor :head

  def initialize(string)
    @head = Node.new(string)
  end

  def print_list
    this_node = @head
    # hey node, if you're not nothing..what are you?
    list = []
    while this_node != nil
      list << this_node.data
      # great, let's go to the next_node
      this_node = this_node.next_node
    end
    list.join(' ')
  end

  def count
    this_node = @head
    counter = 1
    while this_node.next_node != nil
      counter = counter + 1
      this_node = this_node.next_node
    end
    counter
  end

  def append(string)
    this_node = @head
    # do you have a link? then it's your problem
    while this_node.next_node != nil
      this_node = this_node.next_node
    end
    # i don't have a link, so i'll link to the new node
    this_node.next_node = Node.new(string)
  end

  def prepend(string)
    temp_holder = @head
    @head = Node.new(string)
    @head.next_node = temp_holder
  end

  def insert(position, string)
    this_node = @head
    position.times do |i|
      this_node = this_node.next_node
    end
    temp_holder = this_node
    this_node = Node.new(string)
    this_node.next_node = temp_holder
  end

  # def insert(position, string)
  #   this_node = @head
  #   counter = 1
  #   while counter < position
  #     counter = counter + 1
  #     this_node = this_node.next_node
  #   end
  #   temp_holder = this_node
  #   this_node = Node.new(string)
  #   this_node.next_node = temp_holder
  # end

  def includes?(string)
    this_node = @head
    while this_node != string && this_node.next_node != nil
      this_node = this_node.next_node
    end
    if this_node.data == string
      return true
    else
      return false
    end
  end

  def pop
    this_node = @head
    while this_node.next_node.next_node != nil
      this_node = this_node.next_node
    end
    deletion = this_node.next_node.data
    this_node.next_node = nil
    deletion
  end

  def find(position, number_of_elements_to_return)
    this_node = @head
    (position-1).times do |i|
      this_node = this_node.next_node
    end
    list = []
    number_of_elements_to_return.times do |i|
      list << this_node.data
      this_node = this_node.next_node
    end
    list.join(' ')
  end

end
