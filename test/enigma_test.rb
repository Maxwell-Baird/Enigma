require_relative 'test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exist
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt
    enigma = Enigma.new
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_find_offset
    enigma = Enigma.new
    assert_equal 1025, enigma.offset('040895')
  end

  def test_it_can_find_shifts
    enigma = Enigma.new
    expected = [3,27,73,20]
    assert_equal expected, enigma.find_shifts("02715", "040895")
  end

  def test_it_can_move_letters
    enigma = Enigma.new
    assert_equal "keder ohulw", enigma.move_letters
  end
end
