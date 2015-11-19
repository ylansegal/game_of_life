module GameOfLife
  class Simulation
    def next_cell_generation(cell, neighbours)
      live_count = neighbours.count { |item| item.is_a?(LiveCell) }

      case cell
      when LiveCell
        if live_count < 2
          DeadCell.new
        elsif live_count >= 2 && live_count <= 3
          LiveCell.new
        else
          DeadCell.new
        end
      when DeadCell
        if live_count == 3
          LiveCell.new
        else
          DeadCell.new
        end
      end
    end

    def next_grid_generation(grid)
      Grid.build(grid.row_size, grid.column_size) { |row, column|
        next_cell_generation(grid[row, column], grid.adjacent(row, column))
      }
    end
  end
end
