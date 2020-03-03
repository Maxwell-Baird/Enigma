require './lib/enigma'
require 'pry'

ARGV == ['message.txt', 'encrypt.txt']
enigma = Enigma.new
file_read = File.open(ARGV[0], "r")
message = file_read.read().split("\n")
file_read.close
encrypted = enigma.encrypt(message[0])
file_write = File.open(ARGV[1], "w")
file_write.write(encrypted[:encryption])
puts "Created #{ARGV[1]} with the key #{encrypted[:key]} and date #{encrypted[:date]}"
file_write.close
