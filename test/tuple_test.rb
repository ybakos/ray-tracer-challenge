# See features/tuples.feature
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/tuple'

describe Tuple do

  describe "A tuple with w=1.0" do

    X = 4.3
    Y = -4.2
    Z = 3.1
    W = 1.0
    a = Tuple.new(X, Y, Z, W)

    it { a.x.must_equal 4.3 }
    it { a.y.must_equal -4.2 }
    it { a.z.must_equal 3.1 }
    it { a.w.must_equal 1.0 }

    it("is a point") { assert a.point? }
    it("is not a vector") { refute a.vector? }

  end

end
