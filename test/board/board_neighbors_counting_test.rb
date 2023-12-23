# frozen_string_literal: true

require_relative '../../src/classes/board'
require_relative '../../src/classes/cell/alive_cell'
require_relative '../../src/classes/cell/dead_cell'
require_relative './inheritance_classes/abstract_board_generation_test'

# Class to test Board class neighbors counting.
class NeighborsCountingTest < TestAbstractBoardGeneration
  ONE_CELL_BOARD = [[DeadCell.new, DeadCell.new, DeadCell.new],
                    [DeadCell.new, DeadCell.new, DeadCell.new],
                    [DeadCell.new, DeadCell.new, AliveCell.new]].freeze

  RING_BOARD = [[AliveCell.new, AliveCell.new, AliveCell.new],
                [AliveCell.new, DeadCell.new, AliveCell.new],
                [AliveCell.new, AliveCell.new, AliveCell.new]].freeze

  GLIDER_BOARD = [[DeadCell.new, DeadCell.new, AliveCell.new, DeadCell.new],
                  [AliveCell.new, DeadCell.new, AliveCell.new, DeadCell.new],
                  [DeadCell.new, AliveCell.new, AliveCell.new, DeadCell.new],
                  [DeadCell.new, DeadCell.new, DeadCell.new, DeadCell.new]].freeze

  def test_count_neighbors
    # Test when the board has no live cells.
    empty_board = Board.new(@rows, @columns, 0)
    assert_equal 0, empty_board.send(:count_neighbors, 0, 0)

    # Test when the board has a single live cell.
    single_cell_board = Board.new(@rows, @columns, 0)
    single_cell_board.instance_variable_set('@board', ONE_CELL_BOARD)
    assert_equal 1, single_cell_board.send(:count_neighbors, 1, 1)
  end

  def test_stable_blinker_pattern_neighbors
    stable_board = Board.new(3, 3, 0)
    stable_board.instance_variable_set('@board', RING_BOARD)
    assert_equal 8, stable_board.send(:count_neighbors, 1, 1)
  end

  def test_count_patterns_neighbors
    # Test when the board has a glider pattern.
    glider_board = Board.new(4, 4, 0)
    glider_board.instance_variable_set('@board', GLIDER_BOARD)
    assert_equal 1, glider_board.send(:count_neighbors, 0, 0)
    assert_equal 5, glider_board.send(:count_neighbors, 1, 1)
  end

  def test_normal_count_neighbors_row
    # Test when the row has a single live cell.
    single_cell_row = [AliveCell.new, DeadCell.new, DeadCell.new]
    assert_equal 1, @board.send(:count_neighbors_row, single_cell_row, 1)

    # Test when the row has multiple live cells.
    multiple_cell_row = [AliveCell.new, DeadCell.new, AliveCell.new]
    assert_equal 2, @board.send(:count_neighbors_row, multiple_cell_row, 1)
  end

  def test_alternative_count_neighbors_row
    # Test when the row has no live cells.
    empty_row = [DeadCell.new, DeadCell.new, DeadCell.new]
    assert_equal 0, @board.send(:count_neighbors_row, empty_row, 1)

    # Test when the row has a live cell at the beginning
    # (it's necessary eliminate the selected cell if it's alive).
    beginning_cell_row = [AliveCell.new, DeadCell.new, DeadCell.new]
    assert_equal 1, @board.send(:count_neighbors_row, beginning_cell_row, 0)
  end

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
