class Matrix

  attr_reader :rows

  def initialize(rows)
    @rows = rows
  end

  def [](row_index)
    self.rows[row_index]
  end

  

end