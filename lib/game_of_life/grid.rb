require 'matrix'

module GameOfLife
  class Grid < Matrix

    def adjacent(row, column)
      x_min, x_max = [row - 1, 0].max, [row + 1, column_size - 1].min
      y_min, y_max = [column - 1, 0].max, [column + 1, row_size - 1 ].min

      result = []
      (x_min..x_max).each do |x|
        (y_min..y_max).each do |y|
          result << self[x, y] unless x == row && y == column
        end
      end

      result
    end

    def to_s
      row_vectors.inject('') { |result, row|
        result << row.to_a.join('') << "\n"
      }
    end
  end
end