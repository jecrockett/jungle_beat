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

  def test_can_print_one_node
    jb = JungleBeat.new("hi")
    assert_equal "hi", jb.print_list
  end

  def test_can_print_two_nodes
    jb = JungleBeat.new("hi")
    jb.append("there")
    assert_equal "hi there", jb.print_list
  end

  def test_count_for_one_node
    jb = JungleBeat.new("hi")
    assert_equal 1, jb.count
  end

  def test_count_for_multiple_nodes
    jb = JungleBeat.new("hi")
    jb.append("there")
    assert_equal 2, jb.count
  end

end
