require_relative 'testhelper'
require_relative '../lib/offset.rb'
require 'mocha/minitest'


class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end


end
