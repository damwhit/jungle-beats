require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/jungle_beat'

class JungleBeatTest < Minitest::Test

  def test_beat_has_a_value
    new_beat = JungleBeat.new("deep")
    assert_equal "deep", new_beat.beats
  end

  def test_beats_have_values
    new_beats = JungleBeat.new("beep bop")
    assert_equal "beep bop", new_beats.beats
  end

  def test_jb_appends
  new_beats = JungleBeat.new("deep")
  new_beats.append("bop")
  assert_equal "deep bop", new_beats.all
  end

  def test_LL_prepends
    jb = JungleBeat.new("dop")
    jb.prepend("bop")
    assert_equal "bop dop", jb.all
  end

  def test_jb_counts
    jb = JungleBeat.new("dop")
    jb.append("bop")
    jb.append("oop")
    jb.append("rop")
    assert_equal 4, jb.count
  end

  def test_jb_returns_all
    jb = JungleBeat.new("dop")
    jb.append("bop")
    jb.append("oop")
    jb.append("rop")
    assert_equal "dop bop oop rop", jb.all
  end

  def test_jb_pops
    jb = JungleBeat.new("dop")
    jb.append("bop")
    jb.append("oop")
    jb.append("rop")
    assert_equal "rop", jb.pop(1)
    assert_equal "dop bop oop", jb.all
  end

  def test_jb_Pops_two_times
    jb = JungleBeat.new("dop")
    jb.append("bop")
    jb.append("oop")
    jb.append("rop")
    assert_equal "oop rop", jb.pop(2)
  end

  def test_jb_Pops_three_times
    jb = JungleBeat.new("dop")
    jb.append("bop")
    jb.append("oop")
    jb.append("rop")
    assert_equal "bop oop rop", jb.pop(3)
  end

  def test_jb_inserts
    jb = JungleBeat.new("dop")
    jb.append("bop")
    jb.append("oop")
    jb.append("rop")
    jb.insert(3, "lop")
    assert_equal "dop bop oop lop rop", jb.all
  end

  def test_jb_finds
    jb = JungleBeat.new("dop")
    jb.append("bop")
    jb.append("oop")
    jb.append("rop")
    assert_equal "bop oop", jb.find(1, 2)
  end

  def test_jb_includes
    jb = JungleBeat.new("dop")
    jb.append("bop")
    jb.append("oop")
    jb.append("rop")
    assert jb.include?("rop")
  end
  def test_jb_dont_clude
    jb = JungleBeat.new("dop")
    jb.append("bop")
    jb.append("oop")
    jb.append("rop")
    assert_equal false, jb.include?("lop")
  end

end
