require_relative 'node'
require 'pry'

class JungleBeat
  attr_accessor :head

  def initialize(string=nil)
    if string == nil || string.empty?
      return nil
    else
      valid_beats = verify_beats(string)
      assign_new_head(valid_beats)
      append_beats(valid_beats)
    end
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

  def includes?(string)
    this_node = @head
    if this_node == nil || string == nil
      return false
    else
      while this_node.data[0] != string && this_node.next_node != nil
        this_node = this_node.next_node
      end
      true if this_node.data[0] == string
    end
  end

  def append(string)
    valid_beats = verify_beats(string)
    append_beats(valid_beats)
  end

  def prepend(string)
    valid_beats = verify_beats(string)
    temp_holder = @head
    assign_new_head(valid_beats)

    number_of_beats_added = (append_beats(valid_beats) + 1)
    find_tail.next_node = temp_holder

    return number_of_beats_added
  end

  def insert(position, string)
    if count < position
      "No can do, we can't insert that far ahead!"
    else
      if position == 0
        prepend(string)
        return all
      else
        this_node = iterate(position)
        temp_holder = this_node.next_node

        verify_beats(string).each do |beat|
          this_node.next_node = Node.new(beat)
          this_node = this_node.next_node
        end

        find_tail.next_node = temp_holder
        return all
      end
    end
  end

  def pop(number=1)
    if count < number
      "No can do, we don't have that much shit to pop!"
    else
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
  end

  def find(position, number_of_elements_to_return)
    if count < (position + number_of_elements_to_return)
      "No can do, we don't have that many values beyond that position!"
    else
      this_node = iterate(position)
      list = []
      number_of_elements_to_return.times do |i|
        list << this_node.next_node.data
        this_node = this_node.next_node
      end
      list.join(' ')
    end
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

    if @head == nil
      assign_new_head(beats)
      number_of_beats_added = number_of_beats_added + 1
    end

    beats.each do |beat|
      find_tail.next_node = Node.new(beat)
      number_of_beats_added = number_of_beats_added + 1
    end
    number_of_beats_added
  end

  def verify_beats(string)
    acceptable_beats = ['tee',
                        'dee',
                        'deep',
                        'dep',
                        'dop',
                        'bop',
                        'boop',
                        'la',
                        'na']

    valid_beats = []
    string.split.each do |word|
      valid_beats << word if acceptable_beats.include?(word)
    end
    valid_beats
  end

  def iterate(position) # iterates to one node before the requested position
    this_node = @head
    (position-1).times do |i|
      this_node = this_node.next_node
    end
    this_node
  end

# accounts for manually setting the new head to the first beat, and updating the array to reflect the remaining beats to interate through
  def assign_new_head(beats)
    @head = Node.new(beats[0])
    beats.shift
  end

  def play
    `say -r "#{@rate}" -v "#{@voice}" "#{all}"`
    count
  end

  def rate=(rate='500')
    @rate = rate
    @rate
  end

  def reset_rate
    @rate = '500'
    @rate
  end

  def voice=(name='Boing')
    @voice = name.capitalize
    @voice
  end

  def reset_voice
    @voice = 'Boing'
    @voice
  end

end
