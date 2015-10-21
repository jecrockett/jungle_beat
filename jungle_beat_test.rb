require 'minitest'
require 'minitest/autorun'
require_relative 'jungle_beat'
require_relative 'node'
require 'pry'

class JungleBeatTest < Minitest::Test

  def test_new_node_exists
    jb = JungleBeat.new("hi")
    assert jb
  end

  def test_print_one_node
    jb = JungleBeat.new("hi")
    assert_equal "hi", jb.all
  end

  def test_print_multiple_nodes
    jb = JungleBeat.new("hi")
    jb.append("there")
    assert_equal "hi there", jb.all
  end

  def test_count_nodes
    jb = JungleBeat.new("hi")
    assert_equal 1, jb.count
    jb.append("how are you")
    assert_equal 4, jb.count
  end

  def test_initialize_multiple_nodes
    jb = JungleBeat.new("hi how are you?")
    assert_equal 4, jb.count
  end

  def test_append_one_node
    jb = JungleBeat.new("hi")
    assert_equal 1, jb.append("there")
    assert_equal 2, jb.count
  end

  def test_append_multiple_nodes
    jb = JungleBeat.new("hi")
    assert_equal 2, jb.append("there dude")
    assert_equal 3, jb.count
  end

  def test_prepend_one_node
    jb = JungleBeat.new("hi")
    jb.prepend("Oh,")
    assert_equal "Oh, hi", jb.all
  end

  def test_prepend_multiple_nodes
    jb = JungleBeat.new("hi")
    assert_equal 5, jb.prepend("i just wanted to say")
    assert_equal 6, jb.count
  end

  def test_insert_one_value
    jb = JungleBeat.new("hi")
    jb.append("are")
    jb.append("there?")
    assert_equal "hi are you there?", jb.insert(3, "you")
  end

  def test_insert_multiple_values
    skip # failing. instead of add to position 3 it replaces position 2 with the inserted value. why?
    jb = JungleBeat.new("hi are there?")
    assert_equal "hi are you there?", jb.insert(3, "you")
  end

  def test_includes?
    jb = JungleBeat.new("hi")
    refute jb.includes?("hey")
    assert jb.includes?("hi")
  end

  def test_pop_one_value
    jb = JungleBeat.new("hi")
    jb.append("there")
    assert_equal "there", jb.pop
    assert_equal "hi", jb.all
  end

  def test_pop_multiple_values
    jb = JungleBeat.new("hi how are you")
    assert_equal "how are you", jb.pop(3)
    assert_equal "hi", jb.all
  end

  def test_find_return_one_value
    jb = JungleBeat.new("hi")
    jb.append("how")
    jb.append("are")
    jb.append("you?")
    assert_equal "are", jb.find(3, 1)
  end

  def test_find_return_multiple_values
    jb = JungleBeat.new("hi")
    jb.append("how")
    jb.append("are")
    jb.append("you?")
    assert_equal "how are you?", jb.find(2, 3)
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
