require './test/test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_it_starts_without_offsets
    offset = Offset.new

    assert_equal "", offset.offsets
  end

  def test_it_can_get_todays_nocked_date
    offset = mock#Offset.new

    offset.stubs(:today).returns(10519)
    assert_equal 10519, offset.today
  end

  def test_it_can_get_todays_date
    offset = Offset.new
    t = Date.today
    
    expected = t.strftime("%m%d%y").to_i
    assert_equal expected, offset.today
  end

  def test_it_can_get_the_offsets
    offset = Offset.new

    assert_equal "1025", offset.get_offsets(40895)
    assert_equal "1025", offset.offsets
  end

end
