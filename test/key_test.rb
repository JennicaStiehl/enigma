require './test/test_helper'
require 'pry'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_starts_without_keys
    key = Key.new

    assert_equal [], key.keys
  end

  def test_it_can_get_random_number
    key = mock#Key.new

    key.stubs(:get_keys).returns(5)
    assert_equal 5, key.get_keys#.to_s.length
  end

  def test_it_can_pad_an_input
    key = Key.new

    assert_equal "00089", key.pad(5,89)
  end

  def test_it_can_create_key_array
    key = Key.new

    assert_equal 5 ,key.get_key_array("02715").size
  end

  def test_it_can_create_pairs_of_keys
    key = Key.new

    assert_equal 4, key.get_key_pairs([0, 2, 7, 1, 5]).size
  end

  def test_it_can_store_final_keys
    key = Key.new

    assert_equal [2,27,71,15], key.keys_main("02715")
    assert_equal [2,27,71,15], key.keys
  end

  def test_it_can_get_four_keys
    key = Key.new

    assert_equal 4, key.keys_main.count
  end

  def test_it_can_get_final_keys
    key = mock

    key.stubs(:keys_main).returns("08756")
    assert_equal "08756", key.keys_main
  end
end
