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

  describe "PPM data" do

    it "generates the PPM header" do
      c = Canvas.new(5, 3)
      expected_header = <<~PPM
        P3
        5 3
        255
      PPM
      generated_header = c.to_ppm.lines[0..2].join
      assert_equal expected_header, generated_header
    end

    it "generates pixel data" do
      c = Canvas.new(5, 3)
      c1 = Color.new(1.5, 0, 0)
      c2 = Color.new(0, 0.5, 0)
      c3 = Color.new(-0.5, 0, 1)
      c.write_pixel(0, 0, c1)
      c.write_pixel(2, 1, c2)
      c.write_pixel(4, 2, c3)
      expected_ppm = <<~PPM
        255 0 0 0 0 0 0 0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 128 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 255
      PPM
      generated_ppm = c.to_ppm.lines[3..5].join
      assert_equal expected_ppm, generated_ppm
    end

    it "ensures a maximum line length of 70 characters" do
      c = Canvas.new(10, 2)
      pixel = Color.new(1, 0.8, 0.6)
      20.times { |i| c.write_pixel(i % c.width, i / c.width, pixel) }
      expected_ppm = <<~PPM
        255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204
        153 255 204 153 255 204 153 255 204 153 255 204 153
        255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204
        153 255 204 153 255 204 153 255 204 153 255 204 153
      PPM
      generated_ppm = c.to_ppm.lines[3..6].join
      assert_equal expected_ppm, generated_ppm
    end
  end

end
