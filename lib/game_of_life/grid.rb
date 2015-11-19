require "matrix"

module GameOfLife
  class Grid < Matrix
    def adjacent(row, column)
      x_min = [row - 1, 0].max
      x_max = [row + 1, column_size - 1].min
      y_min = [column - 1, 0].max
      y_max = [column + 1, row_size - 1].min

      minor(x_min..x_max, y_min..y_max).to_a.flatten - [self[row, column]]
    end

    def to_s
      row_vectors.inject("") { |result, row|
        result << row.to_a.join("") << "\n"
      }
    end
  end
end
