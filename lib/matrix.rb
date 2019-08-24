class Matrix

  attr_reader :rows

  def initialize(rows)
    @rows = rows
  end

  def [](row_index, column_index)
    self.rows[row_index][column_index]
  end

  def ==(other)
    self.rows == other.rows
  end

end