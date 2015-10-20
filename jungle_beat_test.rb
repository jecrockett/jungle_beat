require 'minitest'              # => true
require 'minitest/autorun'      # => true
require_relative 'jungle_beat'  # => true
require 'pry'                   # => true

class JungleBeatTest < Minitest::Test

  def test_new_node_exists
    skip
    jb = JungleBeat.new("hi")  # => #<JungleBeat:0x007f8a15229010 @head=#<Node:0x007f8a15228fe8 @data="hi", @next_node=nil>>
    assert jb                  # => true
  end

  def test_can_print_one_node
    skip
    jb = JungleBeat.new("hi")         # => #<JungleBeat:0x007f8a152297e0 @head=#<Node:0x007f8a152297b8 @data="hi", @next_node=nil>>
    assert_equal "hi", jb.print_list
  end

  def test_can_print_two_nodes
    jb = JungleBeat.new("hi")
    jb.append("there")
    assert_equal "hi there", jb.print_list
  end

end

# >> Run options: --seed 3596
# >>
# >> # Running:
# >>
# >> Ehi
# >> E.
# >>
# >> Finished in 0.001123s, 2670.7476 runs/s, 890.2492 assertions/s.
# >>
# >>   1) Error:
# >> JungleBeatTest#test_can_:
# >> ArgumentError: wrong number of arguments (0 for 1)
# >>     /Users/JEC/Turing/1Module/Homework/1020_JungleBeat/jungle_beat_test.rb:18:in `test_can_'
# >>
# >>
# >>   2) Error:
# >> JungleBeatTest#test_can_print_one_node:
# >> NoMethodError: undefined method `data' for nil:NilClass
# >>     /Users/JEC/Turing/1Module/Homework/1020_JungleBeat/jungle_beat.rb:11:in `print_list'
# >>     /Users/JEC/Turing/1Module/Homework/1020_JungleBeat/jungle_beat_test.rb:15:in `test_can_print_one_node'
# >>
# >> 3 runs, 1 assertions, 0 failures, 2 errors, 0 skips
