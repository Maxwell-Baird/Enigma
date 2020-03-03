require 'date'

class Enigma

  def encrypt(message, key=rand(10000..99999), date=Date.today)
    find_shifts(key, date)
  end

  def find_shifts(key, date)
    offsets = offset(date)
  end

  def offset(date)
    (date.to_i * date.to_i) % 10000
  end
end
