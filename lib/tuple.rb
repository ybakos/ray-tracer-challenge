class Tuple

  attr_reader :x, :y, :z, :w

  def initialize(x, y, z, w)
    @x = x
    @y = y
    @z = z
    @w = w
  end

  def point?
    true
  end

  def vector?
    false
  end

end
