require_relative 'tuple'

class Canvas

  attr_reader :width, :height, :pixels

  def initialize(width, height)
    @width = width
    @height = height
    @pixels = Array.new(width * height, Color.new(0, 0, 0))
  end

end
