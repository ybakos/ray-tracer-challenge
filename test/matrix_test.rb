# See features/matrices.feature
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/matrix'

describe Matrix do

  describe "Construction" do
    it "of a 4x4 matrix" do
      m = Matrix.new([[1, 2, 3, 4], [5.5, 6.5, 7.5, 8.5], [9, 10, 11, 12], [13.5, 14.5, 15.5, 16.5]])
      assert_equal 1, m[0,0]
      assert_equal 4, m[0,3]
      assert_equal 5.5, m[1,0]
      assert_equal 7.5, m[1,2]
      assert_equal 11, m[2,2]
      assert_equal 13.5, m[3,0]
      assert_equal 15.5, m[3,2]
    end
    it "of a 2x2 matrix" do
      m = Matrix.new([[-3, 5], [1, -2]])
      assert_equal -3, m[0,0]
      assert_equal 5, m[0,1]
      assert_equal 1, m[1,0]
      assert_equal -2, m[1,1]
    end
    it "of a 3x3 matrix" do
      m = Matrix.new([[-3, 5, 0], [1, -2, -7], [0, 1, 1]])
      assert_equal -3, m[0,0]
      assert_equal -2, m[1,1]
      assert_equal 1, m[2,2]
    end
  end

  describe "Comparing" do
    it "identical matrices" do
      a = Matrix.new([[1, 2, 3, 4], [5, 6, 7, 8], [9, 8, 7, 6], [5, 4, 3, 2]])
      b = Matrix.new([[1, 2, 3, 4], [5, 6, 7, 8], [9, 8, 7, 6], [5, 4, 3, 2]])
      assert_equal a, b
    end
    it "different matrices" do
      a = Matrix.new([[1, 2, 3, 4], [5, 6, 7, 8], [9, 8, 7, 6], [5, 4, 3, 2]])
      b = Matrix.new([[2, 3, 4, 5], [6, 7, 8, 9], [8, 7, 6, 5], [4, 3, 2, 1]])
      refute_equal a, b
    end
    it "identical enough floating-point matrices" do
      a = Matrix.new([[0.0, 0.0], [0.0, 0.0]])
      b = Matrix.new([[0.0, 0.000009], [0.0, 0.0]])
      assert_equal a, b
    end
    it "differnt floating-point matrices" do
      a = Matrix.new([[0.0, 0.0], [0.0, 0.0]])
      b = Matrix.new([[0.0, 0.00001], [0.0, 0.0]])
      refute_equal a, b
    end
  end

  describe "Multiplication" do
    it "of two 4x4 matrices" do
      a = Matrix.new([[1, 2, 3, 4], [5, 6, 7, 8], [9, 8, 7, 6], [5, 4, 3, 2]])
      b = Matrix.new([[-2, 1, 2, 3], [3, 2, 1, -1], [4, 3, 6, 5], [1, 2, 7, 8]])
      expected_product = Matrix.new([[20, 22, 50, 48], [44, 54, 114, 108], [40, 58, 110, 102], [16, 26, 46, 42]])
      assert_equal expected_product, a * b
    end
  end

  it "element reading" do
    m = Matrix.new([[1, 2], [3, 4]])
    assert_equal 4, m[1,1]
  end

  it "new element assignment" do
    m = Matrix.new([[0,0], [0,0]])
    m[1,1] = 42
    assert_equal 42, m[1,1]
  end

  it "has columns" do
    m = Matrix.new([[1, 2], [3, 4]])
    assert_equal [2, 4], m.column(1)
  end

end
