module TicTacToeMchliakh
  class IllegalMoveError < StandardError; end

  class Square
    attr_reader :player, :number

    def initialize(board, number, saved=nil)
      @board = board
      @number = number
      @player = saved
      @lines = []
    end

    def ==(other)
      other.player == player
    end

    def <<(line)
      @lines << line
    end

    def line_count
      @lines.size
    end

    def take(player)
      raise IllegalMoveError, 'Square already taken' unless empty?

      @player = player
      notify
    end

    def empty?
      player.nil?
    end

    def taken_by?(player)
      self.player == player
    end

    def taken_by_opponent?(player)
      !empty? && !taken_by?(player)
    end

    def serialize
      player
    end

    private

    def notify
      ([@board] + @lines).map(&:square_taken)
    end
  end
end
