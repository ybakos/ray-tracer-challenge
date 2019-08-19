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
      black = Color.new(0, 0, 0)
      c.pixels.each { |p| assert_equal black, p }
    end
  end

  it "Writes pixels at an x, y location" do
    c = Canvas.new(10, 20)
    red = Color.new(1, 0, 0)
    c.write_pixel(2, 3, red)
    assert_equal red, c.pixel_at(2, 3)
  end

end
