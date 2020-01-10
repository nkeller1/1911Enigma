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
    #option for module later
    assert_equal 27, @encryptmessage.alphabet.length
  end

  def test_convert_letter_into_number
    #option for module later
    assert_equal [26], @encryptmessage.convert(" ")
    assert_equal [7], @encryptmessage.convert("h")
    assert_equal [4], @encryptmessage.convert("e")
    assert_equal [11], @encryptmessage.convert("l")
    assert_equal [11], @encryptmessage.convert("l")
    assert_equal ["!"], @encryptmessage.convert("!")
  end

  def test_encrypt_single_letter
    assert_equal " ", @encryptmessage.encrypt_single_letter(" ", 108)
    assert_equal "k", @encryptmessage.encrypt_single_letter("h", 3)
    assert_equal "e", @encryptmessage.encrypt_single_letter("e", 27)
    assert_equal "e", @encryptmessage.encrypt_single_letter("l", 20)
    assert_equal "d", @encryptmessage.encrypt_single_letter("l", 73)
    assert_equal "!", @encryptmessage.encrypt_single_letter("!", 29)
  end
end
