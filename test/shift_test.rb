require './test/test_helper'
require 'pry'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new

    assert_instance_of Shift, shift
  end

  def test_it_has_attributes
    shift = Shift.new

    assert_equal 27, shift.alphabet.count
  end

  def test_it_can_get_todays_date
    cryptographer = Cryptographer.new

    assert_equal 10519, cryptographer.today
  end

  def test_it_can_get_the_offsets
    cryptographer = Cryptographer.new

    assert_equal "1025", cryptographer.offsets(40895)
  end

  def test_it_can_add_keys_to_shifts
    cryptographer = Cryptographer.new

    assert_equal [3,27,73,20], cryptographer.shifts("02715", "040895")
  end
end
