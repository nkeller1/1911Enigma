require_relative 'testhelper'
require_relative '../lib/cipherkey.rb'

class CipherKeyTest < Minitest::Test
  def setup
    @cipherkey = CipherKey.new
  end

  def test_it_exists
    assert_instance_of CipherKey, @cipherkey
  end

  def test_it_sepeates_to_pairs_with_a_given_key
    pairing = {:a =>12,:b => 23, :c => 34, :d => 45}
    assert_equal pairing, @cipherkey.seperate_to_pairs("12345")

    zero_pair = {:a =>2,:b => 20, :c => 3, :d => 30}
    assert_equal zero_pair, @cipherkey.seperate_to_pairs("02030")
  end
end
