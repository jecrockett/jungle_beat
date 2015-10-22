require 'minitest'
require 'minitest/autorun'
require_relative 'jungle_beat'
require_relative 'node'
require 'pry'

class JungleBeatTest < Minitest::Test

  def test_nil_input_still_works
    assert_equal nil, JungleBeat.new(nil).head
  end

  def test_empty_string_input_still_works
    assert_equal nil, jb = JungleBeat.new("").head
  end

  def test_non_string_input_creates_object
    jb = JungleBeat.new(['tee', 'tee', 'tee'])
    assert_equal nil, jb.head
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
    assert_equal "tee la dee bop", jb.all
  end

  def test_append_one_node
    jb = JungleBeat.new("tee")
    assert_equal 1, jb.append("bop")
    assert_equal "tee bop", jb.all
  end

  def test_append_multiple_nodes
    jb = JungleBeat.new("tee")
    assert_equal 2, jb.append("bop boop")
    assert_equal 3, jb.count
  end

  def test_prepend_one_node
    jb = JungleBeat.new("tee")
    assert_equal 1, jb.prepend("la")
    assert_equal "la tee", jb.all
  end

  def test_prepend_multiple_nodes
    jb = JungleBeat.new("tee")
    assert_equal 5, jb.prepend("boop boop na boop boop")
    assert_equal 6, jb.count
  end

  def test_insert_one_value
    jb = JungleBeat.new("tee dee bop")
    assert_equal "tee dee la bop", jb.insert(2, "la")
    assert_equal "tee dee la bop na", jb.insert(4, "na")
    assert_equal "la tee dee la bop na", jb.insert(0, "la")
  end

  def test_insert_multiple_values
    jb = JungleBeat.new("tee la tee la")
    assert_equal "tee la boop boop tee la", jb.insert(2, "boop boop")
    assert_equal 6, jb.count
  end

  def test_insert_too_many_values
    jb = JungleBeat.new("tee la tee la")
    assert_equal "No can do, we can't insert that far ahead!", jb.insert(5, "boop")
  end

  def test_includes?
    jb = JungleBeat.new("tee")
    refute jb.includes?("dee")
    assert jb.includes?("tee")
  end

  def test_includes_with_empty_list
    jb = JungleBeat.new()
    assert_equal false, jb.includes?("tee")
  end

  def test_includes_with_invalid_string
    jb = JungleBeat.new("tee")
    assert_equal false, jb.includes?("hi")
    assert_equal false, jb.includes?(nil)
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

  def test_pop_too_many_values
      jb = JungleBeat.new("tee da tee da")
      assert_equal "No can do, we don't have that much shit to pop!", jb.pop(5)
  end

  def test_find_return_one_value
    jb = JungleBeat.new("tee na dee la")
    assert_equal "dee", jb.find(2, 1)
  end

  def test_find_return_multiple_values
    jb = JungleBeat.new("tee na dee la")
    assert_equal "dee la", jb.find(2, 2)
    jb.append ("la dee la la la")
    assert_equal "dee la la", jb.find(5, 3)
  end

  def test_find_too_many_values
    jb = JungleBeat.new("tee na dee la")
    assert_equal "No can do, we don't have that many values beyond that position!", jb.find(3, 3)
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
    jb = JungleBeat.new("tee la dee la")
    assert_equal '500', jb.reset_rate
  end

  def test_reset_voice
    jb = JungleBeat.new("tee la dee la")
    assert_equal 'Boing', jb.reset_voice
  end

end
