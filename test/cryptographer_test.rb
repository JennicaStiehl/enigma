require './test/test_helper'
require 'pry'
require './lib/cryptographer'

class CryptographerTest < Minitest::Test

  def test_it_exists
    cryptographer = Cryptographer.new

    assert_instance_of Cryptographer, cryptographer
  end

  def test_it_has_attributes
    cryptographer = Cryptographer.new

    assert_equal 27, cryptographer.alphabet.count
  end

  def test_it_has_an_alphabet
    cryptographer = Cryptographer.new

    assert_equal 'a', cryptographer.alphabet.first
  end

  def test_it_can_add_keys_to_offsets_to_get_shifts
    cryptographer = Cryptographer.new

    assert_equal [3,27,73,20], cryptographer.get_shifts("02715", "040895")
  end

  def test_it_can_create_special_characters_array
    cryptographer = Cryptographer.new

    expected = (["!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "[".."`"])
    assert_equal expected, cryptographer.special_characters
  end
end
