require 'spec_helper'

module GameOfLife
  describe Grid do
    let(:grid) {
      Grid[
            [1, 2, 3],
            [8, 9, 4],
            [7, 6, 5]
          ]
    }

    context '#adjacent' do
      it 'returns adjacent to top-left corner' do
        grid.adjacent(0,0).sort.should == [2, 8, 9]
      end

      it 'returns adjacent to top-middle' do
        grid.adjacent(0,1).sort.should == [1, 3, 8, 9, 4].sort
      end

      it 'returns adjacent to top-right corner' do
        grid.adjacent(0,2).sort.should == [2, 9, 4].sort
      end

      it 'returns adjacent to left-middle' do
        grid.adjacent(1,0).sort.should == [1, 2, 6, 7, 9]
      end

      it 'returns adjacent to middle-center' do
        grid.adjacent(1,1).sort.should == [1, 2, 3, 4, 5, 6, 7, 8]
      end

      it 'returns adjacent to right-middle' do
        grid.adjacent(1,2).sort.should == [2, 3, 5, 6, 9]
      end

      it 'returns adjacent to bottom-left corner' do
        grid.adjacent(2,0).sort.should == [6, 8, 9]
      end

      it 'returns adjacent to bottom middle' do
        grid.adjacent(2,1).sort.should == [4, 5, 7, 8, 9]
      end

      it 'returns adjacent to bottmo-right corner' do
        grid.adjacent(2,2).sort.should == [4, 6, 9]
      end
    end

    context '#to_s' do
      let(:result) { grid.to_s }

      it 'has as many lines as rows' do
        result.split("\n").count.should == 3
      end

      it 'includes all elements' do
        grid.each do |element|
          result.should =~ /#{element}/
        end
      end
    end
  end
end