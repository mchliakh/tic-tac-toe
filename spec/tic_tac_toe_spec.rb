require 'spec_helper'

module TicTacToeMchliakh
  describe TicTacToeMchliakh do
    it 'makes a move' do
      expect(TicTacToeMchliakh.move(1)[:board].compact.sort)
        .to eq([0, 1])
    end

    it 'accepts string input for the square' do
      expect(TicTacToeMchliakh.move(' 1')[:board].compact.sort)
        .to eq([0, 1])
    end

    it 'makes a move on a saved board' do
      board = [nil, nil, nil, 1, 0, nil, nil, nil, nil]
      expect(TicTacToeMchliakh.move(1, board)[:board].compact.sort)
        .to eq([0, 0, 1, 1])
    end

    it 'makes accepts string input for the saved board' do
      board = [nil, nil, nil, '1', '0', nil, nil, nil, nil]
      expect(TicTacToeMchliakh.move(1, board)[:board].compact.sort)
        .to eq([0, 0, 1, 1])
    end

    it 'returns an error when desired square is taken' do
      expect(TicTacToeMchliakh.move(1, Array.new(9, 0)))
        .to have_key(:error)
    end
  end
end
