require 'spec_helper'

module GameOfLife
  describe Simulation do
    context '#next_cell_generation (rules_of_life)' do
      it 'Any live cell with fewer than two live neighbours dies, as if caused by under-population' do
        subject.next_cell_generation(LiveCell.new, [DeadCell.new]).should be_a(DeadCell)
        subject.next_cell_generation(LiveCell.new, [DeadCell.new, LiveCell.new]).should be_a(DeadCell)
      end

      it 'Any live cell with two or three live neighbours lives on to the next generation' do
        subject.next_cell_generation(LiveCell.new, [LiveCell.new]*2).should be_a(LiveCell)
        subject.next_cell_generation(LiveCell.new, [LiveCell.new]*3).should be_a(LiveCell)
      end

      it 'Any live cell with more than three live neighbours dies, as if by overcrowding' do
        subject.next_cell_generation(LiveCell.new, [LiveCell.new]*4).should be_a(DeadCell)
        subject.next_cell_generation(LiveCell.new, [LiveCell.new]*5).should be_a(DeadCell)
      end

      it 'Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction' do
        subject.next_cell_generation(DeadCell.new, [LiveCell.new]*3).should be_a(LiveCell)
      end

      it 'Any other dead cells keep on being dead' do
        subject.next_cell_generation(DeadCell.new, [LiveCell.new]*2).should be_a(DeadCell)
        subject.next_cell_generation(DeadCell.new, [LiveCell.new]*4).should be_a(DeadCell)
      end
    end

    context "next_grid_generation" do
      let(:grid) {
        Grid[
              [1, 2, 3],
              [8, 9, 4],
              [7, 6, 5]
            ]
      }

      it 'returns a new grid of same size' do
        new_grid = subject.next_grid_generation(grid)
        new_grid.row_size.should == grid.row_size
        new_grid.column_size.should == grid.column_size
      end

      it 'evaluates each cell individually' do
        subject.should_receive(:next_cell_generation).exactly(grid.row_size * grid.column_size).times
        subject.next_grid_generation(grid)
      end
    end
  end
end