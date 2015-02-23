module TicTacToeMchliakh
  class Player
    def initialize(board, number)
      @board, @number = board, number
    end

    def next_move
      raise NotImplementedError
    end
  end
end
