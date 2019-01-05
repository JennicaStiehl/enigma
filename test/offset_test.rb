require './test/test_helper'
require 'pry'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_it_has_attributes
    offset = Offset.new

    assert_equal 27, offset.alphabet.count
  end

  def test_it_can_get_todays_date
    offset = Offset.new

    assert_equal 10519, offset.today
  end

  def test_it_can_get_the_offsets
    offset = Offset.new

    assert_equal "1025", offset.get_offsets(40895)
    assert_equal "1025", offset.offsets
  end

  def test_it_can_add_keys_to_shifts
    offset = Offset.new

    assert_equal [3,27,73,20], offset.get_shifts("02715", "040895")
  end
end
