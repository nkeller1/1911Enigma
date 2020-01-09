require_relative 'testhelper'
require_relative '../lib/offset.rb'
require 'mocha/minitest'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_generate_date
    offset = Offset.new

    offset.expects(:generate_date).returns("040895")
    assert_equal "040895", offset.generate_date
  end

  def test_offset_seperated
    offset = Offset.new
    expected = {:a=>1, :b=>0, :c=>2, :d=>5}

    assert_equal expected, offset.offset_seperated("040895")

    expected2 = {:a=>5, :b=>9, :c=>6, :d=>1}
    offset.expects(:offset_seperated).returns(expected2)

    assert_equal expected2, offset.offset_seperated
  end
end
