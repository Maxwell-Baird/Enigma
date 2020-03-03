require 'date'
require 'pry'
class Enigma

  def encrypt(message, key=rand(10000..99999), date=Date.today)
    find_shifts(key, date)
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
