module TicTacToeMchliakh
  class Squares < Array
    def empty
      select(&:empty?)
    end

    def taken_by(player)
      select {|s| s.taken_by?(player) }
    end

    def taken_by_opponent(player)
      select {|s| s.taken_by_opponent?(player) }
    end

    def all_taken?
      none?(&:empty?)
    end

    def all_equal?
      all? {|s| s == first }
    end
  end
end
