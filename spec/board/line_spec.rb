require 'spec_helper'

module TicTacToe
  describe Line do
    before do
      @square = Square.new(nil, 0, 123)
      @line = Line.new(nil, Squares.new([@square]))
    end

    it 'takes an intresection' do
      other = Line.new(nil, Squares.new([@square]))
      expect((@line & other).size).to be(1)
    end

    it 'knows when a player can win' do
      winning_line = Line.new(
        nil, Squares.new([@square, @square, Square.new(nil, 0)])
      )
      expect(winning_line.can_win?(123)).to be(true)
    end

    it 'knows when an player can lose' do
      winning_line = Line.new(
        nil, Squares.new([@square, @square, Square.new(nil, 0)])
      )
      expect(winning_line.can_lose?(321)).to be(true)
    end

    it 'knows when a player could win' do
      empty_square = Square.new(nil, 0)
      maybe_line = Line.new(
        nil, Squares.new([@square, empty_square, empty_square])
      )
      expect(maybe_line.could_win?(123)).to be(true)
    end

    it 'knows when a player could lose' do
      empty_square = Square.new(nil, 0)
      maybe_line = Line.new(
        nil, Squares.new([@square, empty_square, empty_square])
      )
      expect(maybe_line.could_lose?(321)).to be(true)
    end

    it 'notifies board when three in a row' do
      board = double()
      expect(board).to receive(:three_in_a_row).with(123)

      three_in_a_row = Line.new(
        board, Squares.new([@square, @square, @square])
      )
      three_in_a_row.square_taken
    end
  end
end
