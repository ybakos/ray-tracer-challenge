# See features/tuples.feature
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/tuple'
require_relative '../lib/point'

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

end
