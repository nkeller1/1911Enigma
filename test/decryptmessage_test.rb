require_relative 'testhelper'
require_relative '../lib/decryptmessage'

class DecryptTest < Minitest::Test
  def setup
    @decryptmessage = DecryptMessage.new
  end

  def test_it_exists
    assert_instance_of DecryptMessage, @decryptmessage
  end

  def test_alphabet
    assert_equal 27, @decryptmessage.alphabet.length
  end

  def test_alpha_with_index
    assert_equal 27, @decryptmessage.alphabet.length
  end

  def test_convert_letter_into_number
    assert_equal [26], @decryptmessage.convert(" ")
    assert_equal [7], @decryptmessage.convert("h")
    assert_equal [4], @decryptmessage.convert("e")
    assert_equal [11], @decryptmessage.convert("l")
    assert_equal [11], @decryptmessage.convert("l")
    assert_equal ["!"], @decryptmessage.convert("!")
  end

  def test_decrypt_single_letter
    assert_equal " ", @decryptmessage.decrypt_single_letter(" ", 108)
    assert_equal "h", @decryptmessage.decrypt_single_letter("k", 3)
    assert_equal "e", @decryptmessage.decrypt_single_letter("e", 27)
    assert_equal "l", @decryptmessage.decrypt_single_letter("e", 20)
    assert_equal "l", @decryptmessage.decrypt_single_letter("d", 73)
    assert_equal "!", @decryptmessage.decrypt_single_letter("!", 45)
  end
end
