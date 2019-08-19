require_relative 'tuple'

class Canvas

  attr_reader :width, :height, :pixels

  def initialize(width, height)
    @width = width
    @height = height
    @pixels = Array.new(width * height, Color.new(0, 0, 0))
  end

  def write_pixel(x, y, color)
    self.pixels[x + y * self.width] = color
  end

  def pixel_at(x, y)
    self.pixels[x + y * self.width]
  end

end
