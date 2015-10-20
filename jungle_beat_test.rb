require 'minitest'              # => true
require 'minitest/autorun'      # => true
require_relative 'jungle_beat'  # => true
require 'pry'                   # => false

class JungleBeatTest < Minitest::Test

  def test_new_node_exists
    jb = JungleBeat.new("hi")  # => #<JungleBeat:0x007ffab397ab48 @head=#<Node:0x007ffab397ab20 @data="hi", @next_node=nil>>
    assert jb                  # => true
  end

  def test_can_print_one_node
    jb = JungleBeat.new("hi")         # => #<JungleBeat:0x007ffab39831d0 @head=#<Node:0x007ffab3981d58 @data="hi", @next_node=nil>>
    assert_equal "hi", jb.print_list  # => true
  end

  def test_can_print_two_nodes
    jb = JungleBeat.new("hi")               # => #<JungleBeat:0x007ffab397ba20 @head=#<Node:0x007ffab397b9f8 @data="hi", @next_node=nil>>
    jb.append("there")                      # => #<Node:0x007ffab397b7f0 @data="there", @next_node=nil>
    assert_equal "hi there", jb.print_list
  end

end

# >> Run options: --seed 41027
# >>
# >> # Running:
# >>
# >> .F.
# >>
# >> Finished in 0.001105s, 2713.7557 runs/s, 2713.7557 assertions/s.
# >>
# >>   1) Failure:
# >> JungleBeatTest#test_can_print_two_nodes [/Users/JEC/Turing/1Module/Projects/1020_JungleBeat/jungle_beat_test.rb:21]:
# >> Expected: "hi there"
# >>   Actual: "there"
# >>
# >> 3 runs, 3 assertions, 1 failures, 0 errors, 0 skips
