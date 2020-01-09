require_relative 'testhelper'
require_relative '../lib/cipherkey.rb'

class CipherKeyTest < Minitest::Test
  def setup
    @cipherkey = CipherKey.new
  end

  def test_it_exists
    assert_instance_of CipherKey, @cipherkey
  end
end
