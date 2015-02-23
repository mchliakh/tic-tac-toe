require 'spec_helper'

module TicTacToeMchliakh
  describe TicTacToeMchliakh do
    it 'makes a move' do
      expect(TicTacToeMchliakh.move(1)[:board].compact.sort)
        .to eq([0, 1])
    end

    it 'returns an error when desired square is taken' do
      expect(TicTacToeMchliakh.move(1, Array.new(9, 0)))
        .to have_key(:error)
    end
  end
end
