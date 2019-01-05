require './test/test_helper'
require 'pry'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new

    assert_instance_of Encrypt, encrypt
  end


  def test_it_can_encrypt
    encrypt = Encrypt.new

    assert_equal 'keder ohulw', encrypt.encrypt("hello world", "02715", "040895")
  end

end
