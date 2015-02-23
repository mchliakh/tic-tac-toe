module TicTacToeMchliakh
  class Computer < Player
    def next_move
      line = any_winning_line || any_losing_line

      if line
        line.squares.empty.sample
      else
        forks.sample || sticky_situation || @board.squares.empty.max_by(&:line_count)
      end
    end

    private

    def any_winning_line
      @board.lines.can_win(@number).sample
    end

    def any_losing_line
      @board.lines.can_lose(@number).sample
    end

    def forks
      @board.lines.squares_that_can_fork(@number).empty
    end

    def opponent_forks
      @board.lines.squares_that_can_be_forked(@number).empty
    end

    def sticky_situation
      _opponent_forks = opponent_forks

      if opponent_forks.size > 1
        @board.lines.could_win(@number).each do |l|
          non_fork = (l.squares.empty - (l.squares & _opponent_forks)).first
          return (l.squares.empty - [non_fork]).first
        end
      else
        opponent_forks.first
      end
    end
  end
end
