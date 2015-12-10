require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'

class LinkedListTest < Minitest::Test

  def test_head_has_a_value
    list = LinkedList.new("deep")
    assert_equal "deep", list.head.value
  end

  def test_next_node_in_list_is_nil_by_default
    node = Node.new("deep")
    list = LinkedList.new(node)
    assert_equal nil, list.head.next_node
  end

  def test_list_has_a_tail
    list = LinkedList.new("dop")
    assert_equal "dop", list.tail.value
  end

  def test_LL_appends
    list = LinkedList.new("dop")
    list.append("bop")
    assert_equal "dop, bop", list.head.value + ", " + list.tail.value
  end

  def test_LL_prepends
    list = LinkedList.new("dop")
    list.prepend("bop")
    assert_equal "bop, dop", list.head.value + ", " + list.tail.value
  end

  def test_LL_counts
    list = LinkedList.new("dop")
    list.append("bop")
    list.append("oop")
    list.append("rop")
    assert_equal 4, list.count
  end

  def test_LL_returns_all
    list = LinkedList.new("dop")
    list.append("bop")
    list.append("oop")
    list.append("rop")
    assert_equal "dop bop oop rop", list.all
  end

  def test_pop_only_thing
    skip
    list = LinkedList.new("dop")
    assert_equal nil, list
  end
  def test_LL_pops
    list = LinkedList.new("dop")
    list.append("bop")
    list.append("oop")
    list.append("rop")
    assert_equal "rop", list.pop(1)
    assert_equal "dop bop oop", list.all
  end

  def test_LL_Pops_two_times
    list = LinkedList.new("dop")
    list.append("bop")
    list.append("oop")
    list.append("rop")
    assert_equal "oop rop", list.pop(2)
  end

  def test_LL_Pops_three_times
    list = LinkedList.new("dop")
    list.append("bop")
    list.append("oop")
    list.append("rop")
    assert_equal "bop oop rop", list.pop(3)
  end

  def test_LL_inserts
    list = LinkedList.new("dop")
    list.append("bop")
    list.append("oop")
    list.append("rop")
    assert_equal "dop bop oop lop rop", list.insert(3, "lop")
  end

  def test_LL_finds
    list = LinkedList.new("dop")
    list.append("bop")
    list.append("oop")
    list.append("rop")
    assert_equal "bop oop", list.find(1, 2)
  end

  def test_LL_includes
    list = LinkedList.new("dop")
    list.append("bop")
    list.append("oop")
    list.append("rop")
    assert list.include?("rop")
  end
  def test_LL_dont_clude
    list = LinkedList.new("dop")
    list.append("bop")
    list.append("oop")
    list.append("rop")
    assert_equal false, list.include?("lop")
  end
end
