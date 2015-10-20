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

  def append(string)
    this_node = @head
    # do you have a link? then it's your problem
    while this_node.next_node != nil
      this_node = this_node.next_node
    end
    # i don't have a link, so i'll link to the new node
    this_node.next_node = Node.new(string)
  end

end

class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node=nil)
    @data = data
    @next_node = next_node
  end


end
