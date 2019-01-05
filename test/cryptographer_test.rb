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

  def test_it_starts_without_shifts
    cryptographer = Cryptographer.new

    assert_equal [], cryptographer.shifts
  end
end
