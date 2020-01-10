handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

puts incoming_text

encrypted_text = incoming_text.upcase

writer = File.open(ARGV[1], "w")

writer.write(encrypted_text)

writer.close
