require 'tic_tac_toe_mchliakh/board/square'
require 'tic_tac_toe_mchliakh/board/squares'
require 'tic_tac_toe_mchliakh/board/line'
require 'tic_tac_toe_mchliakh/board/lines'
require 'tic_tac_toe_mchliakh/board/board'
require 'tic_tac_toe_mchliakh/players/player'
require 'tic_tac_toe_mchliakh/players/computer'

module TicTacToeMchliakh
  def self.move(square, saved_board=nil)
    square = square.to_i
    saved_board.map! {|s| s.to_i if s } if saved_board

    board = Board.new(saved_board)
    board.square(square).take(1)

    if board.game_over?
      return { board: board.serialize, winner: board.winner }
    end

    computer = Computer.new(board, 0)
    computer.next_move.take(0)

    if board.game_over?
      { board: board.serialize, winner: board.winner }
    else
      { board: board.serialize }
    end
  rescue IllegalMoveError => e
    { error: e.message }
  end
end
