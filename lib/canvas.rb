require_relative 'tuple'

class CanvasCoordinateOutOfBoundsException < ArgumentError; end

class Canvas

  PPM_MAGIC_NUMBER = 'P3'
  MAX_COLOR_VALUE = 255

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
    ppm_header << ppm_pixels
  end

  private

  def ppm_header
    <<~PPM
      #{PPM_MAGIC_NUMBER}
      #{self.width} #{self.height}
      #{MAX_COLOR_VALUE}
    PPM
  end
  
  def ppm_pixels
    "".tap do |ppm|
      self.pixels.each_slice(width) do |row|
        ppm << row.reduce('') { |r, p| r << " #{p.to_ppm}" }.lstrip << "\n"
      end
    end
  end

end
