module TicTacToe
  class Line
    attr_reader :squares

    def initialize(board, squares)
      @board = board
      @squares = squares
      listen
    end

    def &(other)
      squares & other.squares
    end

    def can_win?(player)
      squares.taken_by(player).count == 2 &&
        squares.empty.one?
    end

    def can_lose?(player)
      squares.taken_by_opponent(player).count == 2 &&
        squares.empty.one?
    end

    def could_win?(player)
      squares.taken_by(player).one? &&
        squares.empty.count == 2
    end

    def could_lose?(player)
      squares.taken_by_opponent(player).one? &&
        squares.empty.count == 2
    end

    def square_taken
      if three_in_a_row?
        @board.three_in_a_row(squares.first.player)
      end
    end

    private

    def three_in_a_row?
      squares.all_taken? && squares.all_equal?
    end

    def listen
      squares.each {|s| s << self }
    end
  end
end
