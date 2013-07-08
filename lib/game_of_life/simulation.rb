module GameOfLife
  class Simulation
    def rules_of_life(cell, neighbours)
      live_count = neighbours.select { |item| item.is_a?(LiveCell) }.count

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
  end
end