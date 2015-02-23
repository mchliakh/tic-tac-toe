require 'spec_helper'

module TicTacToeMchliakh
  describe Squares do
    before do
      @squares = Squares.new
      [nil, 123, 321].each do |p|
        @squares << Square.new(nil, 0, p)
      end
    end

    it 'finds empty squares' do
      expect(@squares.empty.count).to be(1)
    end

    it 'finds squares taken by player' do
      expect(@squares.taken_by(123).count).to be(1)
    end

    it 'finds squares taken by opponent' do
      expect(@squares.taken_by_opponent(123).count).to be(1)
    end

    it 'knows when all squares are taken' do
      @squares[0] = Square.new(nil, 0, 123)
      expect(@squares).to be_all_taken
    end

    it 'knows when all squares are equal' do
      @squares[0] = @squares[2] = Square.new(nil, 0, 123)
      expect(@squares).to be_all_equal
    end
  end
end
