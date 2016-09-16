require_relative 'tic_tac_toe'
MARK = [:o, :x]
class TicTacToeNode
  def initialize(board, mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = mark
    @prev_move_pos = prev_move_pos
  end

  def board
    @board
  end

  attr_accessor :prev_move_pos, :next_mover_mark

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_moves = []
    (0..2).each do |x|
      (0..2).each do |y|
        possible_moves << [x,y] if @board.empty?([x,y])
      end
    end
    possible_boards = []
    possible_moves.each do |pos|
      board_dup = @board.dup
      possible_boards << TicTacToeNode.new(@board[pos] = next_mover_mark,next_mark,pos)
    end
    possible_boards
  end

  def next_mark

    MARK.select{|m| m != @next_mover_mark}.first
  end
end
