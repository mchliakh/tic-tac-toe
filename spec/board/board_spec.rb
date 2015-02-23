require 'spec_helper'

module TicTacToeMchliakh
  describe Board do
    before do
      @board = Board.new
    end

    it 'gets a square' do
      expect(@board.square(1).number).to eq(1)
    end

    it 'accepts string input' do
      expect(@board.square(' 1').number).to eq(1)
    end

    it 'loads itself' do
      saved = Board.new(Array.new(9, 123))
      expect(saved.squares).to be_all_taken
    end

    it 'raises an error when square is not 1 to 9' do
      expect {
        @board.square(0).to raise_error(RangeError)
      }
      expect {
        @board.square(10).to raise_error(RangeError)
      }
    end

    it 'serializes itself' do
      expect(@board.serialize).to eq(Array.new(9))
    end
  end
end
