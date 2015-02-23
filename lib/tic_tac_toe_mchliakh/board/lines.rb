module TicTacToeMchliakh
  class Lines < Array
    def can_win(player)
      select {|l| l.can_win?(player) }
    end

    def can_lose(player)
      select {|l| l.can_lose?(player) }
    end

    def could_win(player)
      select {|l| l.could_win?(player) }
    end

    def could_lose(player)
      select {|l| l.could_lose?(player) }
    end

    def squares_that_can_fork(player)
      Squares.new(could_win(player).combination(2).map do |ll|
        (ll.first & ll.last).first
      end.compact)
    end

    def squares_that_can_be_forked(player)
      Squares.new(could_lose(player).combination(2).map do |ll|
        (ll.first & ll.last).first
      end.compact)
    end
  end
end
