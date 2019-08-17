class Tuple

  attr_reader :x, :y, :z, :w

  def initialize(x, y, z, w)
    @x = x.to_f
    @y = y.to_f
    @z = z.to_f
    @w = w.to_f
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
    scalar = scalar.to_f
    Tuple.new(self.x * scalar, self.y * scalar, self.z * scalar, self.w * scalar)
  end

  def /(scalar)
    scalar = scalar.to_f
    Tuple.new(self.x / scalar, self.y / scalar, self.z / scalar, self.w / scalar)
  end

  def magnitude
    Math.sqrt(self.x ** 2 + self.y ** 2 + self.z ** 2 + self.w ** 2)
  end

  def normalize
    Tuple.new(self.x / magnitude, self.y / magnitude, self.z / magnitude, self.w / magnitude)
  end

  def dot_product(other)
    self.x * other.x + self.y * other.y + self.z * other.z + self.w * other.w
  end

  def cross_product(other)
    Tuple.new(
      self.y * other.z - self.z * other.y,
      self.z * other.x - self.x * other.z,
      self.x * other.y - self.y * other.x,
      0)
  end

end

class Vector < Tuple

  def initialize(x, y, z)
    super(x, y, z, 0.0)
  end

end

class Point < Tuple

  def initialize(x, y, z)
    super(x, y, z, 1.0)
  end

end
