class Enigma

  def initialize
    @cipherkey = CipherKey.new
    @offset = Offset.new
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

  def encrypt(message, key = nil, date = nil)
    message_split = message_adjust(message)
    shift_amt = shift(key, date)
  end

end
