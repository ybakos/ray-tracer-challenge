require_relative 'tuple'

class MatrixIndexOutOfBoundsException < ArgumentError; end

class Matrix

  attr_reader :rows

  def self.identity
    Matrix.new([[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]])
  end

  def initialize(rows)
    @rows = rows
  end

  def column(index)
    raise MatrixIndexOutOfBoundsException if index > rows.length - 1
    rows.map { |row| row[index] }
  end

  def [](row_index, column_index)
    if row_index > rows.length - 1 || column_index > rows[0].length - 1
      raise MatrixIndexOutOfBoundsException
    end
    self.rows[row_index][column_index]
  end

  def []=(row_index, column_index, value)
    if row_index > rows.length - 1 || column_index > rows[0].length - 1
      raise MatrixIndexOutOfBoundsException
    end
    self.rows[row_index][column_index] = value
  end

  EPSILON = 0.00001
  def ==(other)
    other_elements = other.rows.flatten
    self.rows.flatten.each_with_index do |e, i|
      return false if (e - other_elements[i]).abs >= EPSILON
    end
    true
  end

  def **(other)
    Matrix.new(other.rows.map {|_|Array.new(other.rows[0].length)}).tap do |m|
      (rows.length).times do |row_index|
        (rows[0].length).times do |col_index|
          m[row_index, col_index] = Tuple.new(*self.rows[row_index]).dot_product(Tuple.new(*other.column(col_index)))
        end
      end
    end
  end

  def *(tuple)
    Tuple.new(
      self[0,0] * tuple.x + self[0,1] * tuple.y + self[0,2] * tuple.z + self[0,3] * tuple.w,
      self[1,0] * tuple.x + self[1,1] * tuple.y + self[1,2] * tuple.z + self[1,3] * tuple.w,
      self[2,0] * tuple.x + self[2,1] * tuple.y + self[2,2] * tuple.z + self[2,3] * tuple.w,
      self[3,0] * tuple.x + self[3,1] * tuple.y + self[3,2] * tuple.z + self[3,3] * tuple.w
    )
  end

  def transpose
    Matrix.new( (0..self.rows.first.length-1).map { |i| self.column(i) } )
  end

  def determinant
    (self[0,0] * self[1,1]) - (self[1,0] * self[0,1])
  end

end
