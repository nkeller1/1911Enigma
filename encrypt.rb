require_relative './lib/enigma'
require_relative './lib/cipherkey'
require_relative './lib/offset'
require_relative './lib/encryptmessage'
require_relative './lib/decryptmessage'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

encrypted_text = enigma.encrypt(incoming_text)

writer = File.open(ARGV[1], "w")

writer.write(encrypted_text[:encryption])

writer.close

puts "Created 'encrypted.txt' with a key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
