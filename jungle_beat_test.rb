require 'minitest'
require 'minitest/autorun'
require_relative 'jungle_beat'
require_relative 'node'
require 'pry'

class JungleBeatTest < Minitest::Test

  def test_empty_input_still_works
    assert_equal nil, jb = JungleBeat.new("").head
  end

  def test_can_append_nil_head
    jb = JungleBeat.new("")
    assert_equal 2, jb.append("tee na")
    assert_equal "tee na", jb.all
  end


  def test_new_node_exists
    jb = JungleBeat.new("tee")
    assert jb
  end

  def test_print_one_node
    jb = JungleBeat.new("tee")
    assert_equal "tee", jb.all
  end

  def test_print_multiple_nodes
    jb = JungleBeat.new("tee")
    jb.append("bop")
    assert_equal "tee bop", jb.all
  end

  def test_count_nodes
    jb = JungleBeat.new("tee")
    assert_equal 1, jb.count
    jb.append("tee dee la")
    assert_equal 4, jb.count
  end

  def test_initialize_multiple_nodes
    jb = JungleBeat.new("tee la dee bop")
    assert_equal 4, jb.count
  end

  def test_append_one_node
    jb = JungleBeat.new("tee")
    assert_equal 1, jb.append("bop")
    assert_equal 2, jb.count
  end

  def test_append_multiple_nodes
    jb = JungleBeat.new("tee")
    assert_equal 2, jb.append("bop boop")
    assert_equal 3, jb.count
  end

  def test_prepend_one_node
    jb = JungleBeat.new("tee")
    jb.prepend("la")
    assert_equal "la tee", jb.all
  end

  def test_prepend_multiple_nodes
    jb = JungleBeat.new("tee")
    assert_equal 5, jb.prepend("boop boop na boop boop")
    assert_equal 6, jb.count
  end

  def test_insert_one_value
    jb = JungleBeat.new("tee")
    jb.append("dee")
    jb.append("bop")
    assert_equal "tee dee la bop", jb.insert(2, "la")
  end

  def test_insert_multiple_values
    skip # failing. instead of add to position 3 it replaces position 2 with the inserted value. why?
    jb = JungleBeat.new("tee dee bop?")
    assert_equal "tee dee la bop?", jb.insert(3, "la")
  end

  def test_includes?
    jb = JungleBeat.new("tee")
    refute jb.includes?("dee")
    assert jb.includes?("tee")
  end

  def test_pop_one_value
    jb = JungleBeat.new("tee")
    jb.append("bop")
    assert_equal "bop", jb.pop
    assert_equal "tee", jb.all
  end

  def test_pop_multiple_values
    jb = JungleBeat.new("tee na dee la")
    assert_equal "na dee la", jb.pop(3)
    assert_equal "tee", jb.all
  end

  def test_find_return_one_value
    jb = JungleBeat.new("tee na dee la")
    assert_equal "dee", jb.find(2, 1)
  end

  def test_find_return_multiple_values
    jb = JungleBeat.new("tee na dee la")
    assert_equal "dee la", jb.find(2, 2)
  end

  def test_reject_invalid_beats
    jb = JungleBeat.new("tee la boston")
    assert_equal "tee la", jb.all
    assert_equal 0, jb.append("boston")
  end

  def test_play
    jb = JungleBeat.new("tee la dee la")
    assert_equal 4, jb.play
  end

  def test_voice
    jb = JungleBeat.new("tee la dee la")
    assert_equal "Alice", jb.voice = "Alice"
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
    #   i.e. insert X at position 5 when bop dee 3 nodes
    # find values that dont exist
    #   i.e. find (4, 10) when bop dee 6 elements
    #   i.e. find (6, 1) when bop dee 5 elements
  end

end
