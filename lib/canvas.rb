require_relative 'tuple'

class CanvasCoordinateOutOfBoundsException < ArgumentError; end

class Canvas

  attr_reader :width, :height, :pixels

  def initialize(width, height)
    @width = width
    @height = height
    @pixels = Array.new(width * height, Color.new(0, 0, 0))
  end

  def write_pixel(x, y, color)
    raise CanvasCoordinateOutOfBoundsException if (x >= width || y >= height) 
    self.pixels[x + y * self.width] = color
  end

  def pixel_at(x, y)
    raise CanvasCoordinateOutOfBoundsException if (x >= width || y >= height) 
    self.pixels[x + y * self.width]
  end

  def to_ppm
    <<~PPM
    P3
    5 3
    255
    PPM
  end

end
