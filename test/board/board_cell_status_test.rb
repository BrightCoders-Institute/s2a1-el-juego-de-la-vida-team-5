# frozen_string_literal: true

require_relative '../../src/classes/board'
require_relative './abstract_board_generation_test'

# Class to test Board class cells status checking.
class CellsStatusCheckingTest < TestAbstractBoardGeneration
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
end
