require_relative 'testhelper'
require_relative '../lib/cipherkey.rb'

class CipherKeyTest < Minitest::Test
  def setup
    @cipherkey = CipherKey.new
  end
end
