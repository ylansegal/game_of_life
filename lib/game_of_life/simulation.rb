module GameOfLife
  class Simulation
    def next_grid_generation(grid)
      Grid.build(grid.row_size, grid.column_size) { |row, column|
        next_cell_generation(grid[row, column], grid.adjacent(row, column))
      }
    end

    def next_cell_generation(cell, neighbours)
      live_count = neighbours.count { |item| item.is_a?(LiveCell) }

      case cell
      when LiveCell
        next_live_cell_generation(live_count)
      when DeadCell
        next_dead_cell_generation(live_count)
      end
    end

    private

    def next_live_cell_generation(live_count)
      live_count == 2 || live_count == 3 ? LiveCell.new : DeadCell.new
    end

    def next_dead_cell_generation(live_count)
      live_count == 3 ? LiveCell.new : DeadCell.new
    end
  end
end
