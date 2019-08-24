class Matrix

  attr_reader :rows

  def initialize(rows)
    @rows = rows
  end

  def [](row_index, column_index)
    self.rows[row_index][column_index]
  end

  EPSILON = 0.00001
  def ==(other)
    other_elements = other.rows.flatten
    self.rows.flatten.each_with_index do |e, i|
      return false if (e - other_elements[i]).abs >= EPSILON
    end
    true
  end

end