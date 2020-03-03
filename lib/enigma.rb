require 'date'
require 'pry'
class Enigma

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    shift =  find_shifts(key, date)
    encrypted_message = move_letters(shift, message)
  end

  def move_letters(shift, message)
    encrypted = []
    each_letter = message.chars.map { |letter| letter}
    shift_count = 0
    each_letter.each do |letter|
      index = @alphabet.index(letter)
      find = (index + shift[shift_count]) % 27
      encrypted << @alphabet[find]
      if shift_count == 3
        shift_count = 0
      else
        shift_count += 1
      end
    end
    encrypted.join
  end

  def find_shifts(key, date)
    shifts = []
    offsets = offset(date).to_s
    shifts << (key[0..1].to_i + offsets[0].to_i)
    shifts << (key[1..2].to_i + offsets[1].to_i)
    shifts << (key[2..3].to_i + offsets[2].to_i)
    shifts << (key[3..4].to_i + offsets[3].to_i)
    shifts
  end

  def offset(date)
    (date.to_i * date.to_i) % 10000
  end
end
