require_relative 'testhelper'
require_relative '../lib/enigma'
require_relative '../lib/offset'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @offset = Offset.new
  end

  def test_it_exist
    assert_instance_of Enigma, @enigma
  end

  def test_date_conditional
    assert_equal  "311219", @enigma.date_conditional("311219")
  end

  def test_key_conditional
    assert_equal "18341", @enigma.key_conditional("18341")
  end

  def test_shift
    expected = [3, 27, 73, 20]
    assert_equal expected, @enigma.shift("02715", "040895")

    offset_expected = {:a =>12,:b => 23, :c => 34, :d => 45}
    @offset.stubs(:offset_seperated).returns(offset_expected)

    assert_equal [6, 31, 71, 15], @enigma.shift("02715")
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
    encrypted = @enigma.encrypt("hello world", "02715")

    expected = {
      decryption: "hello world",
      key: "02715",
      date: encrypted[:date]
    }

    assert_equal expected, @enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_without_key_and_date
    encrypted = @enigma.encrypt("hello world")

    expected = {
      :decryption=>"hello world",
      :key=>encrypted[:key],
      :date=>encrypted[:date]
    }

    assert_equal expected, @enigma.decrypt(encrypted[:encryption], encrypted[:key])
  end
end
