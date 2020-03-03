require './lib/enigma'

ARGV == [message.txt, encrypt.txt]
enigma = Engima.new
file_read = File.open(ARGV[0], "r")
message = file_read.read
file.close
encrypted = enigma.encrypt(message)
file_write = File.open(ARGV[1], "w")
file_write.write(ARGV[1], encrypted[:encryption])
puts "Created #{ARGV[1]} with the key #{encrypted[:key]} and date #{encrypted[:date]}"
