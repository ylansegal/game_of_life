require 'spec_helper'

module GameOfLife
  describe Simulation do
    context '#rules_of_life' do
      it 'Any live cell with fewer than two live neighbours dies, as if caused by under-population' do
        subject.rules_of_life(LiveCell.new, [DeadCell.new]).should be_a(DeadCell)
        subject.rules_of_life(LiveCell.new, [DeadCell.new, LiveCell.new]).should be_a(DeadCell)
      end

      it 'Any live cell with two or three live neighbours lives on to the next generation' do
        subject.rules_of_life(LiveCell.new, [LiveCell.new]*2).should be_a(LiveCell)
        subject.rules_of_life(LiveCell.new, [LiveCell.new]*3).should be_a(LiveCell)
      end

      it 'Any live cell with more than three live neighbours dies, as if by overcrowding' do
        subject.rules_of_life(LiveCell.new, [LiveCell.new]*4).should be_a(DeadCell)
        subject.rules_of_life(LiveCell.new, [LiveCell.new]*5).should be_a(DeadCell)
      end

      it 'Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction' do
        subject.rules_of_life(DeadCell.new, [LiveCell.new]*3).should be_a(LiveCell)
      end

      it 'Any other dead cells keep on being dead' do
        subject.rules_of_life(DeadCell.new, [LiveCell.new]*2).should be_a(DeadCell)
        subject.rules_of_life(DeadCell.new, [LiveCell.new]*4).should be_a(DeadCell)
      end
    end
  end
end