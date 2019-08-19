# See features/canvas.feature
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/canvas'
require_relative '../lib/tuple'

describe Canvas do

  describe "Creation" do
    c = Canvas.new(10, 20)
    it { assert_equal 10, c.width }
    it { assert_equal 20, c.height }
    it "has pixels all set to (0, 0, 0)" do
      c.pixels.each { |p| assert_equal Color.new(0, 0, 0), p }
    end
  end

end
