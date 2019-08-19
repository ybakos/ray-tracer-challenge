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

  it "raises an exception if x or y are out of bounds" do
    c = Canvas.new(10, 20)
    assert_raises CanvasCoordinateOutOfBoundsException do
      c.write_pixel(c.width, 0, Color.new(0, 0, 0))
    end
    assert_raises CanvasCoordinateOutOfBoundsException do
      c.write_pixel(0, c.height, Color.new(0, 0, 0))
    end
    assert_raises CanvasCoordinateOutOfBoundsException do
      c.pixel_at(c.width, 0)
    end
    assert_raises CanvasCoordinateOutOfBoundsException do
      c.pixel_at(0, c.height)
    end
  end

end
