module TicTacToeMchliakh
  class Board
    attr_reader :squares, :lines, :winner

    def initialize(saved=nil)
      setup do
        if saved
          saved.map.with_index do |s, n|
            squares << Square.new(self, n + 1, s)
          end
        else
          9.times {|n| squares << Square.new(self, n + 1) }
        end
      end
    end

    def square(number)
      unless 1.upto(9).include?(number)
        raise RangeError, 'Choose a number between 1 and 9'
      end

      squares[number - 1]
    end

    def game_over?
      !!@game_over
    end

    def square_taken
      game_over if squares.all_taken?
    end

    def three_in_a_row(player)
      @winner = player
      game_over
    end

    def serialize
      squares.map(&:serialize)
    end

    private

    def setup
      @squares = Squares.new
      yield
      build_lines
    end

    def build_lines
      @lines = Lines.new

      lines_of_three.each do |lot|
        lines << Line.new(self,
          Squares.new(lot.map {|s| squares[s] })
        )
      end
    end

    def lines_of_three
      [
        [0, 1, 2],
        [2, 5, 8],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [3, 4, 5],
        [0, 4, 8],
        [2, 4, 6]
      ]
    end

    def game_over
      @game_over = true
    end
  end
end
