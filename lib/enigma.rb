require 'date'
require 'pry'
class Enigma

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key=random_key, date)
    shift =  find_shifts(key, date)
    encrypted_message = move_letters(shift, message)
    hash = {
      :encryption => encrypted_message,
      :key => key,
      :date => date
    }
  end

  def decrypt(ciphertext, key, date)
    shift =  find_shifts(key, date)
    decrypted_message = move_letters_left(shift, ciphertext)
    hash = {
      :decryption => decrypted_message,
      :key => key,
      :date => date
    }
  end

  def move_letters_left(shift, message)
    encrypted = []
    each_letter = message.chars.map { |letter| letter}
    shift_count = 0
    each_letter.each do |letter|
      index = @alphabet.index(letter)
      find = (index - shift[shift_count]) % 27
      encrypted << @alphabet[find]
      if shift_count == 3
        shift_count = 0
      else
        shift_count += 1
      end
    end
    encrypted.join
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

  def random_key
    random = rand(0..99999).to_s
    while random.length < 5
      random.insert(0, '0')
    end
    random
  end

  def find_date
    holder = Date.today.to_s
    date = []
    date << holder[-2..-1]
    date << holder[-5..-4]
    date << holder[-8..-7]
    date.join
  end
end
