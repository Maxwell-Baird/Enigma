require_relative 'enigma'

enigma = Enigma.new
file_read = File.open(ARGV[0], "r")
messages = file_read.read().split("\n")
message = messages.join(' ')
file_read.close
encrypted = enigma.decrypt(message,ARGV[2],ARGV[3])
file_write = File.open(ARGV[1], "w")
file_write.write(encrypted[:decryption])
puts "Created #{ARGV[1]} with the key #{encrypted[:key]} and date #{encrypted[:date]}"
file_write.close
