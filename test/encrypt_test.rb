require './test/test_helper'
require 'pry'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new

    assert_instance_of Encrypt, encrypt
  end

  def test_it_has_an_alphabet
    encrypt = Encrypt.new

    assert_equal 'a', encrypt.alphabet.first
  end

  # def test_it_has_keys
  #   encrypt = Encrypt.new
  #
  #   assert_equal 5, encrypt.get_keys.length
  # end

  def test_it_can_pad_an_input
    encrypt = Encrypt.new

    assert_equal "00089", encrypt.pad(5,89)
  end

  def test_it_can_create_key_array
    encrypt = Encrypt.new

    assert_equal 5 ,encrypt.get_key_array("02715").size
  end

  def test_it_can_create_pairs_of_keys
    encrypt = Encrypt.new

    assert_equal 4, encrypt.get_key_pairs([0, 2, 7, 1, 5]).size
  end

  def test_it_can_get_final_keys
    encrypt = Encrypt.new

    assert_equal [2,27,71,15], encrypt.keys_main("02715")
  end

  def test_it_can_get_todays_date
    encrypt = Encrypt.new

    assert_equal 10519, encrypt.today
  end

  def test_it_can_get_the_offsets
    encrypt = Encrypt.new

    assert_equal "1025", encrypt.offsets(40895)
  end

  def test_it_can_add_keys_to_shifts
    encrypt = Encrypt.new

    assert_equal [3,27,73,20], encrypt.shifts("02715", "040895")
  end

  def test_it_can_encrypt
    encrypt = Encrypt.new

    assert_equal 'keder ohulw', encrypt.encrypt("hello world", "02715", "040895")
  end

end
