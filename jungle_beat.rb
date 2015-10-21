require_relative 'node'
require 'pry'

class JungleBeat
  attr_accessor :head

  def initialize(string)
    beats = string.split
    @head = Node.new(beats[0])
    this_node = @head

    beats.shift
    beats.each do |beat|
      this_node.next_node = Node.new(beat)
      this_node = this_node.next_node
    end
  end

  def all
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
    beats = string.split
    number_of_beats_added = 0
    this_node = @head

    while this_node.next_node != nil
      this_node = this_node.next_node
    end

    beats.each do |beat|
      this_node.next_node = Node.new(beat)
      number_of_beats_added = number_of_beats_added + 1
      this_node = this_node.next_node
    end
    number_of_beats_added
  end

  def prepend(string)
    #set up variables
    beats = string.split
    temp_holder = @head
    @head = Node.new(beats[0])
    this_node = head
    number_of_beats_added = 1

    # remove the first value, which has already been set to @head, and iterate through the rest to create nodes
    beats.shift
    beats.each do |beat|
      this_node.next_node = Node.new(beat)
      number_of_beats_added = number_of_beats_added + 1
      this_node = this_node.next_node
    end

    # find the tail of the prepended values
    while this_node.next_node != nil
      this_node = this_node.next_node
    end

    # reconnect the remaining list to the prepended values
    this_node.next_node = temp_holder
    return number_of_beats_added
  end

  def insert(position, string)
    this_node = @head
    (position-2).times do |i|
      this_node = this_node.next_node
    end
    temp_holder = this_node.next_node
    this_node.next_node = Node.new(string)
    this_node.next_node.next_node = temp_holder
    return all
  end

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
