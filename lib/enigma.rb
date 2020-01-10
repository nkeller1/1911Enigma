class Enigma

  def initialize
    @cipherkey = CipherKey.new
    @offset = Offset.new
    @encryptmessage = EncryptMessage.new
    @decryptmessage = DecryptMessage.new
  end

  def date_conditional(date = nil)
    return @offset.generate_date if date == nil
    date
  end

  def shift(key = nil, date = nil)
    code_key = @cipherkey.seperate_to_pairs(key)
    offset_amt = @offset.offset_seperated(date)
    code_key.merge(offset_amt) { |placement, old, new| old + new }.values
  end

  def message_adjust(message)
    message.downcase.split("").to_a
  end

  def encrypt(message, key = nil, date = nil)
    message_split = message_adjust(message)
    shift_amt = shift(key, date)
    encrypted_msg = message_split.reduce([]) do |acc, letter|
      acc << @encryptmessage.encrypt_single_letter(letter, shift_amt.first)
      shift_amt.rotate!
      acc
  end.join

  {
  :encryption => encrypted_msg,
  :key => key,
  :date => date_conditional(date)
  }
  end

  def decrypt(message, key, date)
    message_split = message_adjust(message)
    shift_amt = shift(key, date)
    decrypted_msg = message_split.reduce([]) do |acc, letter|
      acc << @decryptmessage.decrypt_single_letter(letter, shift_amt.first)
      shift_amt.rotate!
      acc
  end.join

  {
  :decryption => decrypted_msg,
  :key => key,
  :date => date
  }
  end
end
