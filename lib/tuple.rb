class Tuple

  attr_reader :x, :y, :z, :w

  def initialize(x, y, z, w)
    @x = x
    @y = y
    @z = z
    @w = w
  end

  def point?
    w == 1.0
  end

  def vector?
    w == 0.0
  end

  EPSILON = 0.00001
  def ==(other)
    (self.x - other.x).abs < EPSILON &&
    (self.y - other.y).abs < EPSILON &&
    (self.z - other.z).abs < EPSILON &&
    (self.w - other.w).abs < EPSILON
  end

end
