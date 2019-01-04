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

  def test_it_has_keys
    encrypt = Encrypt.new

    assert_equal 5, encrypt.keys.length
  end

  def test_it_can_pad_an_input
    encrypt = Encrypt.new

    assert_equal "00089", encrypt.pad(5,89)
  end

  def test_it_can_create_pairs_of_keys
    encrypt = Encrypt.new

    assert_equal 5 ,encrypt.key_array.size
  end

end
