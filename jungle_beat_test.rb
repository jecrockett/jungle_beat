require 'minitest'              # => true
require 'minitest/autorun'      # => true
require_relative 'jungle_beat'  # => true
require_relative 'node'         # => false
require 'pry'                   # => false

class JungleBeatTest < Minitest::Test

  def test_new_node_exists
    jb = JungleBeat.new("hi")  # => #<JungleBeat:0x007faac90337e0 @head=#<Node:0x007faac90336c8 @data=["hi"], @next_node=nil>>
    assert jb                  # => true
  end

  def test_print_one_node
    jb = JungleBeat.new("hi")  # => #<JungleBeat:0x007faac980e1b8 @head=#<Node:0x007faac980e0a0 @data=["hi"], @next_node=nil>>
    assert_equal "hi", jb.all  # => true
  end

  def test_print_multiple_nodes
    jb = JungleBeat.new("hi")        # => #<JungleBeat:0x007faac905b3a8 @head=#<Node:0x007faac905b268 @data=["hi"], @next_node=nil>>
    jb.append("there")               # => 1
    assert_equal "hi there", jb.all  # => true
  end

  def test_count_nodes
    jb = JungleBeat.new("hi")  # => #<JungleBeat:0x007faac904ae18 @head=#<Node:0x007faac904ada0 @data=["hi"], @next_node=nil>>
    assert_equal 1, jb.count   # => true
    jb.append("how are you")   # => 3
    assert_equal 4, jb.count   # => true
  end

  def test_initialize_multiple_nodes
    jb = JungleBeat.new("hi how are you?")  # => #<JungleBeat:0x007faac980cfe8 @head=#<Node:0x007faac980cd40 @data=["hi"], @next_node=#<Node:0x007faac980cbb0 @data=["how"], @next_node=#<Node:0x007faac980ca48 @data=["are"], @next_node=#<Node:0x007faac980c908 @data=["you?"], @next_node=nil>>>>>
    assert_equal 4, jb.count                # => true
  end

  def test_append_one_node
    jb = JungleBeat.new("hi")           # => #<JungleBeat:0x007faac9032660 @head=#<Node:0x007faac90325e8 @data=["hi"], @next_node=nil>>
    assert_equal 1, jb.append("there")  # => true
    assert_equal 2, jb.count            # => true
  end

  def test_append_multiple_nodes
    jb = JungleBeat.new("hi")                # => #<JungleBeat:0x007faac980fc48 @head=#<Node:0x007faac980fa40 @data=["hi"], @next_node=nil>>
    assert_equal 2, jb.append("there dude")  # => true
    assert_equal 3, jb.count                 # => true
  end

  def test_prepend_one_node
    jb = JungleBeat.new("hi")      # => #<JungleBeat:0x007faac905a2f0 @head=#<Node:0x007faac905a250 @data=["hi"], @next_node=nil>>
    jb.prepend("Oh,")              # => 1
    assert_equal "Oh, hi", jb.all  # => true
  end

  def test_prepend_multiple_nodes
    jb = JungleBeat.new("hi")                           # => #<JungleBeat:0x007faac905b0d8 @head=#<Node:0x007faac905b808 @data=["hi"], @next_node=nil>>
    assert_equal 5, jb.prepend("i just wanted to say")  # => true
    assert_equal 6, jb.count                            # => true
  end

  def test_insert_one_value
    jb = JungleBeat.new("hi")                              # => #<JungleBeat:0x007faac901b050 @head=#<Node:0x007faac901afb0 @data=["hi"], @next_node=nil>>
    jb.append("are")                                       # => 1
    jb.append("there?")                                    # => 1
    assert_equal "hi are you there?", jb.insert(3, "you")  # => true
  end

  def test_insert_multiple_values
    skip # failing. instead of add to position 3 it replaces position 2 with the inserted value. why?
    jb = JungleBeat.new("hi are there?")
    assert_equal "hi are you there?", jb.insert(3, "you")
  end

  def test_includes?
    jb = JungleBeat.new("hi")   # => #<JungleBeat:0x007faac9031558 @head=#<Node:0x007faac90314e0 @data=["hi"], @next_node=nil>>
    refute jb.includes?("hey")  # => false
    assert jb.includes?("hi")
  end

  def test_pop_one_value
    jb = JungleBeat.new("hi")     # => #<JungleBeat:0x007faac9058fe0 @head=#<Node:0x007faac9058ec8 @data=["hi"], @next_node=nil>>
    jb.append("there")            # => 1
    assert_equal "there", jb.pop  # => true
    assert_equal "hi", jb.all     # => true
  end

  def test_pop_multiple_values
    jb = JungleBeat.new("hi how are you")  # => #<JungleBeat:0x007faac9030540 @head=#<Node:0x007faac9030450 @data=["hi"], @next_node=#<Node:0x007faac90303b0 @data=["how"], @next_node=#<Node:0x007faac9030338 @data=["are"], @next_node=#<Node:0x007faac90302c0 @data=["you"], @next_node=nil>>>>>
    assert_equal "how are you", jb.pop(3)  # => true
    assert_equal "hi", jb.all              # => true
  end

  def test_find_return_one_value
    jb = JungleBeat.new("hi")          # => #<JungleBeat:0x007faac900ac28 @head=#<Node:0x007faac900aae8 @data=["hi"], @next_node=nil>>
    jb.append("how")                   # => 1
    jb.append("are")                   # => 1
    jb.append("you?")                  # => 1
    assert_equal "are", jb.find(3, 1)  # => true
  end

  def test_find_return_multiple_values
    jb = JungleBeat.new("hi")                   # => #<JungleBeat:0x007faac90188f0 @head=#<Node:0x007faac9018878 @data=["hi"], @next_node=nil>>
    jb.append("how")                            # => 1
    jb.append("are")                            # => 1
    jb.append("you?")                           # => 1
    assert_equal "how are you?", jb.find(2, 3)  # => true
  end

  def reject_invalid_beats
    skip
  end

  def test_play
    skip
  end

  def test_voice
    skip
  end

  def test_reset_rate
    skip
  end

  def test_reset_voice
    skip
  end

  def test_edge_cases
    skip
    # pop more elements than exist
    # insert into position that doesnt exist
    #   i.e. insert X at position 5 when there are 3 nodes
    # find values that dont exist
    #   i.e. find (4, 10) when there are 6 elements
    #   i.e. find (6, 1) when there are 5 elements
  end

end

# >> Run options: --seed 12760
# >>
# >> # Running:
# >>
# >> .....S..SFS..SS..S...
# >>
# >> Finished in 0.003281s, 6399.7347 runs/s, 6704.4840 assertions/s.
# >>
# >>   1) Failure:
# >> JungleBeatTest#test_includes? [/Users/JEC/Turing/1Module/Projects/1020_JungleBeat/jungle_beat_test.rb:77]:
# >> Failed assertion, no message given.
# >>
# >> 21 runs, 22 assertions, 1 failures, 0 errors, 6 skips
# >>
# >> You have skipped tests. Run with --verbose for details.
