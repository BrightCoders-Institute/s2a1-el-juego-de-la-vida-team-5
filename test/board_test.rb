# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../board'

# Class to specify arguments types testing methods.
class TestArgumentTypes < Minitest::Test
  def setup
    @rows = 5
    @columns = 5
    @initial_cells_amount = 5
    @board = Board.new(@rows, @columns, @initial_cells_amount)
  end

  private

  def count_board_alive_cells(board)
    board.sum { |row| row.sum { |cell| cell } }
  end

  public

  def test_board_initial_generation
    # Check if the board keeps correctly generated.
    @board.send(:obtain_initial_cells)
    refute_empty @board.board

    assert_kind_of Array, @board.board

    @board.board.each do |row|
      assert_kind_of Array, row
      row.each do |cell|
        assert_kind_of Integer, cell
      end
    end
  end

  def test_board_random_generation
    # Check if the method generates exactly the specified alive cells.
    assert_equal @initial_cells_amount, count_board_alive_cells(@board.board)
  end

  def test_set_alive_cell_status
    # Test when the cell is alive and has 1 or less neighbors.
    (-100..1).each do |number|
      assert_equal 0, @board.send(:set_cell_status, 1, number)
    end

    # Test when the cell is alive and has 2 or 3 neighbors.
    (2..3).each do |number|
      assert_equal 1, @board.send(:set_cell_status, 1, number)
    end

    # Test when the cell is alive and has 4 or more neighbors.
    (4..100).each do |number|
      assert_equal 0, @board.send(:set_cell_status, 1, number)
    end
  end

  def test_set_dead_cell_status
    # Test when the cell is dead and has 2 or less neighbors.
    (-100..2).each do |number|
      assert_equal 0, @board.send(:set_cell_status, 0, number)
    end

    # Test when the cell is dead and has 3 neighbors.
    assert_equal 1, @board.send(:set_cell_status, 0, 3)

    # Test when the cell is dead and has 4 or more neighbors.
    (4..100).each do |number|
      assert_equal 0, @board.send(:set_cell_status, 0, number)
    end
  end

  def test_next_gen
    # Test when the board has no live cells.
    empty_board = Board.new(@rows, @columns, 0)
    empty_board.next_gen
    assert_equal 0, count_board_alive_cells(empty_board.board)

    # Test when the board has a single live cell.
    single_cell_board = Board.new(@rows, @columns, 1)
    single_cell_board.next_gen
    assert_equal 1, count_board_alive_cells(single_cell_board.board)
  end

  def test_stable_blinker_line_gen_pattern
    blinker_line = Board.new(3, 3, 3)
    blinker_line.instance_variable_set('@board', [[0, 0, 0], [1, 1, 1], [0, 0, 0]])
    blinker_line.next_gen
    assert_equal [[0, 1, 0], [0, 1, 0], [0, 1, 0]], blinker_line.board
    blinker_line.next_gen
    assert_equal [[0, 0, 0], [1, 1, 1], [0, 0, 0]], blinker_line.board
    blinker_line.next_gen
    assert_equal [[0, 1, 0], [0, 1, 0], [0, 1, 0]], blinker_line.board
  end

  def test_stable_ring_pattern
    ring_board = Board.new(4, 4, 4)
    ring_board.instance_variable_set('@board', [[0, 0, 0, 0], [0, 0, 1, 0], [1, 1, 0, 0], [0, 1, 0, 0]])
    ring_board.next_gen
    assert_equal [[0, 0, 0, 0], [0, 1, 0, 0], [1, 1, 1, 0], [1, 1, 0, 0]], ring_board.board
    ring_board.next_gen
    assert_equal [[0, 0, 0, 0], [1, 1, 1, 0], [0, 0, 1, 0], [1, 0, 1, 0]], ring_board.board
    ring_board.next_gen
    assert_equal [[0, 1, 0, 0], [0, 1, 1, 0], [1, 0, 1, 1], [0, 1, 0, 0]], ring_board.board
    ring_board.next_gen
    assert_equal [[0, 1, 1, 0], [1, 0, 0, 1], [1, 0, 0, 1], [0, 1, 1, 0]], ring_board.board
  end

  def test_stable_horizontal_diamond_pattern
    stable_board = Board.new(3, 4, 4)
    stable_board.instance_variable_set('@board', [[0, 0, 0, 0], [0, 1, 1, 1], [0, 1, 0, 0]])
    stable_board.next_gen
    assert_equal [[0, 0, 1, 0], [0, 1, 1, 0], [0, 1, 0, 0]], stable_board.board
    stable_board.next_gen
    assert_equal [[0, 1, 1, 0], [0, 1, 1, 0], [0, 1, 1, 0]], stable_board.board
    stable_board.next_gen
    assert_equal [[0, 1, 1, 0], [1, 0, 0, 1], [0, 1, 1, 0]], stable_board.board
    stable_board.next_gen
    assert_equal [[0, 1, 1, 0], [1, 0, 0, 1], [0, 1, 1, 0]], stable_board.board
  end

  def test_stable_vertical_diamond_pattern
    stable_board = Board.new(4, 3, 4)
    stable_board.instance_variable_set('@board', [[0, 1, 0], [0, 1, 0], [0, 1, 0], [0, 1, 0]])
    stable_board.next_gen
    assert_equal [[0, 0, 0], [1, 1, 1], [1, 1, 1], [0, 0, 0]], stable_board.board
    stable_board.next_gen
    assert_equal [[0, 1, 0], [1, 0, 1], [1, 0, 1], [0, 1, 0]], stable_board.board
    stable_board.next_gen
    assert_equal [[0, 1, 0], [1, 0, 1], [1, 0, 1], [0, 1, 0]], stable_board.board
  end

  def test_stable_square_gen_pattern
    stable_board = Board.new(3, 3, 3)
    stable_board.instance_variable_set('@board', [[0, 0, 0], [0, 1, 1], [0, 1, 1]])
    stable_board.next_gen
    assert_equal [[0, 0, 0], [0, 1, 1], [0, 1, 1]], stable_board.board
    stable_board.next_gen
    assert_equal [[0, 0, 0], [0, 1, 1], [0, 1, 1]], stable_board.board
    stable_board.next_gen
    assert_equal [[0, 0, 0], [0, 1, 1], [0, 1, 1]], stable_board.board
  end

  def test_next_gen_patterns
    # Test when the board has a glider pattern.
    glider_board = Board.new(3, 3, 5)
    glider_board.next_gen
    assert_equal [[0, 1, 0], [0, 0, 1], [1, 1, 1]], glider_board.board
  end

  def test_count_neighbors
    # Test when the board has no live cells.
    empty_board = Board.new(@rows, @columns, 0)
    assert_equal 0, empty_board.send(:count_neighbors, 0, 0)

    # Test when the board has a single live cell.
    single_cell_board = Board.new(@rows, @columns, 1)
    assert_equal 1, single_cell_board.send(:count_neighbors, 1, 1)

    # Test when the board has a stable pattern (blinker)
    stable_board = Board.new(3, 3, 3)
    assert_equal 1, stable_board.send(:count_neighbors, 1, 1)

    # Test when the board has a glider pattern.
    glider_board = Board.new(@rows, @columns, 0)
    assert_equal 1, glider_board.send(:count_neighbors, 0, 0)
    assert_equal 2, glider_board.send(:count_neighbors, 1, 1)
  end

  def test_count_neighbors_row
    # Test when the row has no live cells.
    empty_row = [0, 0, 0]
    assert_equal 0, @board.send(:count_neighbors_row, empty_row, 1)

    # Test when the row has a single live cell.
    single_cell_row = [0, 0, 0]
    assert_equal 0, @board.send(:count_neighbors_row, single_cell_row, 1)

    # Test when the row has multiple live cells.
    multiple_cell_row = [1, 0, 1]
    assert_equal 2, @board.send(:count_neighbors_row, multiple_cell_row, 1)

    # Test when the row has a live cell at the beginning
    beginning_cell_row = [1, 0, 0]
    assert_equal 0, @board.send(:count_neighbors_row, beginning_cell_row, 0)
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
