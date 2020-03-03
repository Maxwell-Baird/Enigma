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
    Date.stubs(:today).returns('2020-03-01')
    assert_equal '010320', enigma.encrypt("hello world", "02715")[:date]
    enigma.stubs(:rand).returns(135)
    assert_equal '00135', enigma.encrypt("hello world")[:key]
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
    Date.stubs(:today).returns('2020-03-01')
    assert_equal '010320', enigma.decrypt("keder ohulw", "02715")[:date]
  end

  def test_it_can_move_letters_left
    enigma = Enigma.new
    assert_equal "hello world", enigma.move_letters_left([3,27,73,20], "keder ohulw")
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
    assert_equal "keder ohulw", enigma.move_letters([3,27,73,20], "hello world")
  end

  def test_it_can_generate_random_key
    enigma = Enigma.new
    enigma.stubs(:rand).returns(135)
    assert_equal '00135', enigma.random_key
  end

  def test_it_can_find_date
    enigma = Enigma.new
<<<<<<< HEAD
    Date.stubs(:today).returns(010320)
=======
    Date.stubs(:today).returns('2020-03-01')
>>>>>>> 547b7f300334398043cb51c87708b72cb8320200
    assert_equal '010320', enigma.find_date
  end
end
