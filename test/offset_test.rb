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

    offset.expects(:generate_date).returns("090120")

    assert_equal "090120", offset.generate_date
  end


end
