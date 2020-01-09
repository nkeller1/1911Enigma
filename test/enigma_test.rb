require_relative 'testhelper'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exist
    assert_instance_of Enigma, @enigma
  end

  def test_date_conditional
    #write a stub for the random generate_date
    assert_equal  "311219", @enigma.date_conditional("311219")
  end

  
end
