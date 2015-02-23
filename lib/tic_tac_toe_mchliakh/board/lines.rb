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
  end
end
