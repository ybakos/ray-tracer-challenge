# See features/tuples.feature
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/tuple'

describe Tuple do

  describe "A tuple with w=1.0" do

    a = Tuple.new(4.3, -4.2, 3.1, 1.0)

    it { a.x.must_equal 4.3 }
    it { a.y.must_equal -4.2 }
    it { a.z.must_equal 3.1 }
    it { a.w.must_equal 1.0 }

    it("is a point") { assert a.point? }
    it("is not a vector") { refute a.vector? }

  end

  describe "A tuple with w=0" do
    a = Tuple.new(4.3, -4.2, 3.1, 0.0)

    it { a.x.must_equal 4.3 }
    it { a.y.must_equal -4.2 }
    it { a.z.must_equal 3.1 }
    it { a.w.must_equal 0.0 }

    it("is not a point") { refute a.point? }
    it("is not a vector") { assert a.vector? }

  end

end
