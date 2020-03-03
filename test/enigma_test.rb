require_relative 'test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exist
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end
end
