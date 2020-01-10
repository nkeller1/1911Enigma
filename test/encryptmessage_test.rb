require_relative 'testhelper'
require_relative '../lib/encryptmessage'

class EncryptTest < Minitest::Test
  def setup
    @encryptmessage = EncryptMessage.new
  end

  def test_it_exists
    assert_instance_of EncryptMessage, @encryptmessage
  end

  def test_alphabet
    #option for module here and w/ decrypt
    assert_equal 27, @encryptmessage.alphabet.length
  end

  def test_alpha_with_index
    #option for modugle here with decrypt
    assert_equal 27, @encryptmessage.alphabet.length
  end

end
