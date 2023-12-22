# frozen_string_literal: true

require_relative '../../src/classes/board'
require_relative './abstract_board_generation_test'

# Class to test Board class rows limitations.
class RowsLimitationsTest < TestAbstractBoardGeneration
  def test_obtain_limit_row
    # Test when row index is out of bounds (negative).
    assert_equal [], @board.send(:obtain_row, -1)

    # Test when row index is ot of bounds (greater than the number of rows).
    assert_equal [], @board.send(:obtain_row, @rows)
  end

  def test_obtain_row
    # Test when row index is at the beginning of the board.
    assert_equal @board.board[0], @board.send(:obtain_row, 0)

    # Test when row index is in the middle of the board.
    middle_row_index = @rows / 2
    assert_equal @board.board[middle_row_index], @board.send(:obtain_row, middle_row_index)

    # Test when row index is at the end of the board.
    assert_equal @board.board[-1], @board.send(:obtain_row, @rows - 1)
  end
end
