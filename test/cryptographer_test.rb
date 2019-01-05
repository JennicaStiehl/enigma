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

  def test_it_can_pad_an_input
    cryptographer = Cryptographer.new

    assert_equal "00089", cryptographer.pad(5,89)
  end

  def test_it_can_create_key_array
    cryptographer = Cryptographer.new

    assert_equal 5 ,cryptographer.get_key_array("02715").size
  end

  def test_it_can_create_pairs_of_keys
    cryptographer = Cryptographer.new

    assert_equal 4, cryptographer.get_key_pairs([0, 2, 7, 1, 5]).size
  end

  def test_it_can_get_final_keys
    cryptographer = Cryptographer.new

    assert_equal [2,27,71,15], cryptographer.keys_main("02715")
  end

end
