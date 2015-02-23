require 'spec_helper'

module TicTacToeMchliakh
  describe Lines do
    before do
      @board = Board.new([
          0, nil,   0,
        nil, nil, nil,
        nil, nil, nil
      ])
    end

    it 'finds winning lines' do
      expect(@board.lines.can_win(0).count).to be(1)
    end

    it 'finds losing lines' do
      expect(@board.lines.can_lose(1).count).to be(1)
    end

    it 'finds potentially winning lines' do
      expect(@board.lines.could_win(0).count).to be(4)
    end

    it 'finds potentially losing lines' do
      expect(@board.lines.could_lose(1).count).to be(4)
    end

    context 'opponent can fork' do
      before do
        @board = Board.new([
            0, nil, nil,
          nil,   1,   0,
          nil, nil, nil
        ])
      end

      it 'finds squares that can fork' do
        squares_that_can_fork = @board.lines.squares_that_can_fork(0)
        expect(squares_that_can_fork.empty.count).to be(1)
      end

      it 'finds squares that can be forked' do
        squares_that_can_be_forked = @board.lines.squares_that_can_be_forked(1)
        expect(squares_that_can_be_forked.empty.count).to be(1)
      end
    end
  end
end
