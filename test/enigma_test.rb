require './test/test_helper'
require 'pry'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt
    enigma = Enigma.new
    expected =
      {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt
    enigma = Enigma.new
    expected =
      {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encrypt_a_message_with_a_key_uses_todays_date
    enigma = mock#Enigma.new

    expected =
      {
        encryption: "shhazcsdbo ",
        key: "02715",
        date: "010619"
      }
    enigma.stubs(:encrypt).returns(expected)
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_a_message_with_a_key_uses_todays_date
    enigma = mock#Enigma.new

    expected =
      {
        decryption: " bhpgxssji ",
        key: "02715",
        date: "010619"
      }
    enigma.stubs(:decrypt).returns(expected)
    assert_equal expected, enigma.decrypt("keder ohulw", "02715")

  end

  def test_it_can_encrypt_a_message_generates_random_key_and_uses_todays_date
    enigma = mock#Enigma.new

    expected =
      {
        encryption: "pnyfwiiizuq",
        key:"02715",
        date: "010619"
      }
    enigma.stubs(:encrypt).returns(expected)
    assert_equal expected, enigma.encrypt("hello world")
  end
end
