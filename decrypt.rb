require_relative './lib/enigma'
require_relative './lib/cipherkey'
require_relative './lib/offset'
require_relative './lib/encryptmessage'
require_relative './lib/decryptmessage'
require_relative './lib/encrypt'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

encrypted_message = handle.read

handle.close

decrypted_text = enigma.decrypt(encrypted_message)

writer = File.open(ARGV[1], "w")

writer.write(decrypted_text)

writer.close

puts "Created 'decrypt.txt' with a key #{enigma.key_conditional} and date #{enigma.date_conditional}"
