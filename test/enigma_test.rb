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

  def test_key_conditional
    #write a stub for the random generate_date
    assert_equal  "18341", @enigma.key_conditional("18341")
  end

  def test_shift
    expected = [3, 27, 73, 20]
    assert_equal expected, @enigma.shift("02715", "040895")

    @enigma.expects(:shift).returns([56, 12, 42, 19])
    assert_equal [56, 12, 42, 19], @enigma.shift
  end

  def test_message_adjust
    expected = ["h", "e", "l", "l", "o"]

    assert_equal expected, @enigma.message_adjust("hello")
  end

  def test_encrypt
    expected = {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")

    expected2 = {
    encryption: " s qgtjyhkdczcsel!",
    key: "03452",
    date: "090120"
    }

    assert_equal expected2, @enigma.encrypt("THIS IS A MESSAGE!", "03452", "090120")
  end

  def test_decrypt
    expected1 = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected1, @enigma.decrypt("keder ohulw", "02715", "040895")

    expected2 = {
    decryption: "this is a message!",
    key: "03452",
    date: "090120"
    }

    assert_equal expected2, @enigma.decrypt(" s qgtjyhkdczcsel!", "03452", "090120")
  end

  def test_encrypt_and_decrypt_without_date_passed_in
    expected = {
    decryption: "hello world",
    key: "02715",
    date: "070120"
    }

    # assert_equal ({}), @enigma.encrypt("hello world", "02715")
    assert_equal expected, @enigma.decrypt("nib udmcxpu", "02715", "070120")
  end

  def test_without_key_and_date
    skip
    # @enimga.expects(:encrypt).returns(expected = {
    #   encryption: "keder ohulw",
    #   key: "02715",
    #   date: "040895"})

    # assert_equal ({}), @enigma.encrypt("hello world")
    assert_equal [], @enigma.decrypt("ckszjfcbmrk", "18341", "100120")
  end
end
