# frozen_string_literal: true

require_relative '../../src/classes/board'
require_relative '../../src/classes/cell/cell'
require_relative './inheritance_classes/abstract_board_generation_test'

# Class to test Board class patterns generation.
class TestBoardPatternsGeneration < TestAbstractBoardGeneration
  private

  def count_board_alive_cells(board)
    board.sum { |row| row.sum { |cell| cell.class::VALUE } }
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
        assert_kind_of Cell, cell
      end
    end
  end

  def test_board_random_generation
    # Check if the method generates exactly the specified alive cells.
    assert_equal @initial_cells_amount, count_board_alive_cells(@board.board)
  end

  def test_next_gen
    # Test when the board has no live cells.
    empty_board = Board.new(@rows, @columns, 0)
    empty_board.next_gen
    assert_equal 0, count_board_alive_cells(empty_board.board)

    # Test when the board has a single live cell.
    single_cell_board = Board.new(@rows, @columns, 1)
    single_cell_board.next_gen
    assert_equal 0, count_board_alive_cells(single_cell_board.board)
  end
end
