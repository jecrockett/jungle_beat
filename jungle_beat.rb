class JungleBeat
  attr_accessor :head  # => nil

  def initialize(string)
    @head = Node.new(string)
  end

  def head
    @head
  end

  def print_list
    this_node = head
    # hey node, if you're not nothing..what are you?
    while this_node.data != nil
      puts "#{this_node.data}"
      # if i delete the line below, i get an error for undefined method 'data' for NilClass. Why?
        require 'pry';binding.pry

      # great, let's go to the next_node
      this_node = this_node.next_node
    end

  end

  # def print_list
  #   this_node = @head
  #   list = ""
  #   # hey node, if you're not nothing..what are you?
  #   while this_node.data != nil
  #     # shovel into the output list
  #     list << this_node.data
  #     # great, let's go to the next_node
  #     this_node = this_node.next_node
  #   end
  #   puts list
  # end

  # def print_list
  #   this_node = @head
  #   list = ""
  #   # hey node, if you're not nothing..what are you?
  #   loop do
  #     if this_node.data == nil
  #       break
  #     else
  #     # shovel into the output list
  #     list << this_node.data
  #     # great, let's go to the next_node
  #     this_node = this_node.next_node
  #     end
  #   end
  #   list
  # end

  def append(string)
    this_node = head
    # do you have a link? then it's your problem
    while this_node.next_node != nil
      this_node = this_node.next_node
    end
    # i don't have a link, so i'll link to the new node
    this_node.next_node = Node.new(string)
  end

end

class Node
  attr_accessor :data, :next_node  # => nil

  def initialize(data, next_node=nil)
    @data = data
    @next_node = next_node
  end


end
