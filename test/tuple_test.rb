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
  end

end
