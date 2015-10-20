require 'minitest'              # => true
require 'minitest/autorun'      # => true
require_relative 'jungle_beat'  # => true
require_relative 'node'         # => false
require 'pry'                   # => false

class JungleBeatTest < Minitest::Test

  def test_new_node_exists
    jb = JungleBeat.new("hi")  # => #<JungleBeat:0x007fe7e9aa81c8 @head=#<Node:0x007fe7e9aa81a0 @data="hi", @next_node=nil>>
    assert jb                  # => true
  end

  def test_print_one_node
    jb = JungleBeat.new("hi")         # => #<JungleBeat:0x007fe7e9aa1418 @head=#<Node:0x007fe7e9aa13f0 @data="hi", @next_node=nil>>
    assert_equal "hi", jb.print_list  # => true
  end

  def test_print_two_nodes
    jb = JungleBeat.new("hi")               # => #<JungleBeat:0x007fe7e9aa0ae0 @head=#<Node:0x007fe7e9aa0ab8 @data="hi", @next_node=nil>>
    jb.append("there")                      # => #<Node:0x007fe7e9aa0888 @data="there", @next_node=nil>
    assert_equal "hi there", jb.print_list  # => true
  end

  def test_count_one_node
    jb = JungleBeat.new("hi")  # => #<JungleBeat:0x007fe7e9aa0220 @head=#<Node:0x007fe7e9aa01f8 @data="hi", @next_node=nil>>
    assert_equal 1, jb.count   # => true
  end

  def test_count_multiple_nodes
    jb = JungleBeat.new("hi")    # => #<JungleBeat:0x007fe7e9a9b748 @head=#<Node:0x007fe7e9a9b658 @data="hi", @next_node=nil>>
    jb.append("there")           # => #<Node:0x007fe7e9a9b248 @data="there", @next_node=nil>
    assert_equal 2, jb.count     # => true
  end

  def test_prepend
    jb = JungleBeat.new("hi")             # => #<JungleBeat:0x007fe7e9aa3600 @head=#<Node:0x007fe7e9aa35d8 @data="hi", @next_node=nil>>
    jb.prepend("Oh,")                     # => #<Node:0x007fe7e9aa35d8 @data="hi", @next_node=nil>
    assert_equal "Oh, hi", jb.print_list  # => true
  end

  def test_insert
    skip
    jb = JungleBeat.new("hi,")
    jb.append("are")
    jb.append("there?")
    jb.insert(3, "you")
    assert_equal "hi, are you there?", jb.print_list
  end

  def test_includes?
    jb = JungleBeat.new("hi")   # => #<JungleBeat:0x007fe7e9aa2c78 @head=#<Node:0x007fe7e9aa2c50 @data="hi", @next_node=nil>>
    refute jb.includes?("hey")  # => false
    assert jb.includes?("hi")   # => true
  end

  def test_pop
    jb = JungleBeat.new("hi")         # => #<JungleBeat:0x007fe7e9aa2570 @head=#<Node:0x007fe7e9aa2548 @data="hi", @next_node=nil>>
    jb.append("there")                # => #<Node:0x007fe7e9aa2200 @data="there", @next_node=nil>
    jb.pop                            # => "there"
    assert_equal "hi", jb.print_list
  end

end

# >> Run options: --seed 48765
# >>
# >> # Running:
# >>
# >> ...F...S.
# >>
# >> Finished in 0.003915s, 2298.9022 runs/s, 2298.9022 assertions/s.
# >>
# >>   1) Failure:
# >> JungleBeatTest#test_pop [/Users/JEC/Turing/1Module/Projects/1020_JungleBeat/jungle_beat_test.rb:61]:
# >> Expected: "hi"
# >>   Actual: "hi there"
# >>
# >> 9 runs, 9 assertions, 1 failures, 0 errors, 1 skips
# >>
# >> You have skipped tests. Run with --verbose for details.
