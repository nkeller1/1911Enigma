class Enigma

  def initialize
    @cipherkey = CipherKey.new
    @offset = Offset.new
  end

  def date_conditional(date = nil)
    return @offset.generate_date if date == nil
    date
  end

end
