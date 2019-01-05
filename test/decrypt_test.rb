require './test/test_helper'
require 'pry'
require './lib/decrypt'

class DecryptTest < Minitest::Test

  def test_it_exists
    decrypt = Decrypt.new

    assert_instance_of Decrypt, decrypt
  end


  def test_it_can_decrypt
    decrypt = Decrypt.new

    assert_equal 'hello world', decrypt.decrypt("keder ohulw", "02715", "040895")
  end

end
