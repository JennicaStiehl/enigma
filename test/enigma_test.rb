require './test/test_helper'
require 'pry'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_check_shifts
    enigma = Enigma.new

    assert_equal [3, 27, 73, 20], enigma.check_shifts("02715", "040895")
  end

  def test_it_can_check_shifts_with_todays_date
    enigma = Enigma.new

    assert_equal [5, 28, 77, 16], enigma.check_shifts("02715","010619")
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

  def test_it_can_encrypt_with_special_characters
    enigma = Enigma.new
    expected =
      {
        encryption: "keder ohulw!!",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.encrypt("hello world!!", "02715", "040895")
  end

  def test_it_can_encrypt_with_special_characters_in_different_spots
    enigma = Enigma.new
    keys = "02715"
    date = "040895"
    shifts = enigma.get_shifts(keys, date)

    expected =
      {
        encryption: "/keder/ohulw/",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, enigma.encrypt("/hello/world/", "02715", "040895")
    assert_equal "/keder/ohulw/", enigma.get_encrypted_message("/hello/world/", shifts)
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
