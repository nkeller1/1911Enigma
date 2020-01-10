require_relative 'testhelper'
require_relative '../lib/encryptmessage'

class EncryptTest < Minitest::Test
  def setup
    @encryptmessage = EncryptMessage.new
  end

  def test_it_exists
    assert_instance_of EncryptMessage, @encryptmessage
  end

end
