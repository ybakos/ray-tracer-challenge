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

  def +(other)
    Tuple.new(self.x + other.x, self.y + other.y, self.z + other.z, self.w + other.w)
  end

  def -(other)
    Tuple.new(self.x - other.x, self.y - other.y, self.z - other.z, self.w - other.w)
  end

  def -@
    Tuple.new(-self.x, -self.y, -self.z, -self.w)
  end

  def *(scalar)
    Tuple.new(self.x * scalar, self.y * scalar, self.z * scalar, self.w * scalar)
  end

end
