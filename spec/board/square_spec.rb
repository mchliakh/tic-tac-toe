require 'spec_helper'

module TicTacToeMchliakh
  describe Square do
    before do
      @board = double()
      allow(@board).to receive(:square_taken)

      @square = Square.new(@board, 0)
    end

    it 'is empty when initialized' do
      expect(@square).to be_empty
    end

    it 'loads itself' do
      saved = Square.new(@board, 0, 123)
      expect(saved.player).to be(123)
    end

    it 'compares itself' do
      other = Square.new(@board, 0)
      expect(@square == other).to be(true)

      @square.take(123)
      expect(@square == other).to be(false)
    end

    it 'adds lines' do
      expect(@square.line_count).to be(0)
      @square << nil
      expect(@square.line_count).to be(1)
    end

    it 'notifies board when taken' do
      expect(@board).to receive(:square_taken)
      @square.take(123)
    end

    it 'can only be taken once' do
      @square.take(123)
      expect {
        @square.take(321)
      }.to raise_error(IllegalMoveError)
    end

    it 'knows when taken by player' do
      @square.take(123)
      expect(@square.taken_by?(123)).to be(true)
    end

    it 'knows when taken by opponent' do
      @square.take(321)
      expect(@square.taken_by_opponent?(123)).to be(true)
    end

    it 'serializes itself' do
      @square.take(123)
      expect(@square.serialize).to be(123)
    end
  end
end
