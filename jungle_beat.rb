require_relative 'node'
require 'pry'

class JungleBeat
  attr_accessor :head

  def initialize(string)
    beats = string.split
    @head = Node.new(beats[0])
    this_node = @head
    beats.shift
    append_beats(beats)
  end

  def all
    this_node = @head
    list = []
    while this_node != nil
      list << this_node.data
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
    append_beats(beats)
  end

  def prepend(string)
    beats = string.split
    temp_holder = @head
    @head = Node.new(beats[0])
    beats.shift

    number_of_beats_added = (append_beats(beats) + 1)

    find_tail.next_node = temp_holder

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
    # if this node == string break else move to the next
    while this_node.data[0] != string && this_node.next_node != nil
      this_node = this_node.next_node
    end
    if this_node.data[0] == string
      return true
    else
      return false
    end
  end

  def pop(number=1)
    this_node = @head
    deletions = []
    number.times do |i|
      while this_node.next_node.next_node != nil
        this_node = this_node.next_node
      end
      deletions.unshift(this_node.next_node.data)
      this_node.next_node = nil
      this_node = @head
    end
    deletions.join(' ')
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

  def find_tail
    this_node = @head
    while this_node.next_node != nil
      this_node = this_node.next_node
    end
    this_node
  end

  def append_beats(beats)
    number_of_beats_added = 0
    beats.each do |beat|
      find_tail.next_node = Node.new(beat)
      number_of_beats_added = number_of_beats_added + 1
    end
    number_of_beats_added
  end

end
