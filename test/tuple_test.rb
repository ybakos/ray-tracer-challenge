# See features/tuples.feature
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/tuple'
require_relative '../lib/point'
require_relative '../lib/vector'

describe Tuple do

  describe "A tuple with w=1.0" do

    a = Tuple.new(4.3, -4.2, 3.1, 1.0)

    it { assert_equal(4.3, a.x) }
    it { assert_equal(-4.2, a.y) }
    it { assert_equal(3.1, a.z) }
    it { assert_equal(1.0, a.w) }

    it("is a point") { assert a.point? }
    it("is not a vector") { refute a.vector? }

  end

  describe "A tuple with w=0" do
    a = Tuple.new(4.3, -4.2, 3.1, 0.0)

    it { assert_equal(4.3, a.x) }
    it { assert_equal(-4.2, a.y) }
    it { assert_equal(3.1, a.z) }
    it { assert_equal(0.0, a.w) }

    it("is not a point") { refute a.point? }
    it("is not a vector") { assert a.vector? }

  end

  describe "point() creates tuples with w=1" do
    p = Point.new(4, -4, 3)
    it { assert_equal(1.0, p.w) }
  end

  describe "vector() creates tuples with w=0" do
    v = Vector.new(4, -4, 3)
    it { assert_equal(0.0, v.w) }
  end

  describe "Tuple equivalence" do
    it "holds true when two tuples have the same component values" do
      a = Tuple.new(1, 1, 1, 1)
      b = Tuple.new(1, 1, 1, 1)
      assert a == b
    end

    it "does not hold true when two tuples have different component values" do
      a = Tuple.new(0, 1, 1, 1) # Good enough
      b = Tuple.new(1, 1, 1, 1)
      refute a == b
    end

    it "holds true when two tuples have different values within an epsilon" do
      a = Tuple.new(1.000001, 1, 1, 1)
      b = Tuple.new(1.000000, 1, 1, 1)
      assert a == b
    end

  end

  describe "Adding two tuples" do
    a1 = Tuple.new(3, -2, 5, 1)
    a2 = Tuple.new(-2, 3, 1, 0)
    sum = Tuple.new(1, 1, 6, 1)
    it { assert_equal sum, a1 + a2 }
  end

  describe "Subtracting" do
    describe "two points" do
      p1 = Point.new(3, 2, 1)
      p2 = Point.new(5, 6, 7)
      difference = Vector.new(-2, -4, -6)
      it { assert_equal difference, p1 - p2 }
    end
    describe "a vector from a point" do
      p1 = Point.new(3, 2, 1)
      p2 = Vector.new(5, 6, 7)
      difference = Point.new(-2, -4, -6)
      it { assert_equal difference, p1 - p2 }
    end
    describe "two vectors" do
      p1 = Vector.new(3, 2, 1)
      p2 = Vector.new(5, 6, 7)
      difference = Vector.new(-2, -4, -6)
      it { assert_equal difference, p1 - p2 }
    end
  end

  describe "Negating" do
    describe "by subtracting a vector from the zero vector" do
      zero = Vector.new(0, 0, 0)
      v = Vector.new(1, -2, 3)
      negated = Vector.new(-1, 2, -3)
      it { assert_equal negated, zero - v }
    end
    describe "a tuple" do
      a = Tuple.new(1, -2, 3, -4)
      negated = Tuple.new(-1, 2, -3, 4)
      it { assert_equal negated, -a }
    end
  end

  describe "Multiplying" do
    describe "a tuple by a scalar" do
      a = Tuple.new(1, -2, 3, -4)
      result = Tuple.new(3.5, -7.0, 10.5, -14.0)
      it { assert_equal result, a * 3.5 }
    end
    describe "a tuple by an integer" do
      a = Tuple.new(1, -2, 3, -4)
      result = Tuple.new(3.0, -6.0, 9.0, -12.0)
      it { assert_equal result, a * 3 }
    end
    describe "a tuple by a fraction" do
      a = Tuple.new(1, -2, 3, -4)
      result = Tuple.new(0.5, -1, 1.5, -2)
      it { assert_equal result, a * 0.5 }
    end
  end

  describe "Dividing a tuple by a scalar" do
    a = Tuple.new(1, -2, 3, -4)
    result = Tuple.new(0.5, -1, 1.5, -2)
    it { assert_equal result, a / 2 }
  end

  describe "Magnitude" do
    it "of (1, 0, 0)" do
      assert_equal 1.0, Vector.new(1, 0, 0).magnitude
    end
    it "of (0, 1, 0)" do
      assert_equal 1.0, Vector.new(0, 1, 0).magnitude
    end
    it "of (0, 0, 1)" do
      assert_equal 1.0, Vector.new(0, 0, 1).magnitude
    end
    it "of (1, 2, 3)" do
      assert_equal Math.sqrt(14), Vector.new(1, 2, 3).magnitude
    end
    it "of (-1, -2, -3)" do
      assert_equal Math.sqrt(14), Vector.new(-1, -2, -3).magnitude
    end
    it "of a normalized vector" do
      assert_equal 1.0, Vector.new(1, 2, 3).normalize.magnitude
    end
  end

  describe "Normalization" do
    it "of (4, 0, 0)" do
      assert_equal Vector.new(1, 0, 0), Vector.new(4, 0, 0).normalize
    end
    it "of (1, 2, 3)"do
      assert_equal Vector.new(0.26726, 0.53452, 0.80178), Vector.new(1, 2, 3).normalize
    end
  end

  describe "Dot product" do
    it "of two tuples" do
      a = Vector.new(1, 2, 3)
      b = Vector.new(2, 3, 4)
      assert_equal 20.0, a.dot_product(b)
    end
  end

end
