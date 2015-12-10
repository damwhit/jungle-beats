require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'

class NodeTest < Minitest::Test

  def test_node_has_a_value
    node = Node.new("deep")
    assert_equal "deep", node.value
  end

  def test_next_node_is_nil_by_default
    node = Node.new("dep")
    assert_equal nil, node.next_node
  end

  def test_next_node_can_be_assigned
    node = Node.new("dep")
    node2 = Node.new("deep", node)
    assert_equal node, node2.next_node
  end

  def test_value_can_pass_through_next_node
    node = Node.new("dep")
    node2 = Node.new("deep", node)
    assert_equal "dep", node2.next_node.value
  end

  def test_node_can_be_found_from_another_node
    node = Node.new("dep")
    node2 = Node.new("deep", node)
    node3 = Node.new("bleep", node2)
    assert_equal node, node3.next_node.next_node
  end

  def test_value_can_be_found_from_another_node
    node = Node.new("dep")
    node2 = Node.new("deep", node)
    node3 = Node.new("bleep", node2)
    assert_equal "dep", node3.next_node.next_node.value
  end

end
