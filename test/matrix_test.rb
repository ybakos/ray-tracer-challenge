# See features/matrices.feature
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/matrix'

describe Matrix do

  describe "Construction" do
    it "a 4x4 matrix" do
      m = Matrix.new([[1, 2, 3, 4], [5.5, 6.5, 7.5, 8.5], [9, 10, 11, 12], [13.5, 14.5, 15.5, 16.5]])
      assert_equal 1, m[0][0]
      assert_equal 4, m[0][3]
      assert_equal 5.5, m[1][0]
      assert_equal 7.5, m[1][2]
      assert_equal 11, m[2][2]
      assert_equal 13.5, m[3][0]
      assert_equal 15.5, m[3][2]
    end
  end

end