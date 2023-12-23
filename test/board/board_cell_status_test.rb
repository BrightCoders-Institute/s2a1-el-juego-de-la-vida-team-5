# frozen_string_literal: true

require_relative '../../src/classes/board'
require_relative '../../src/classes/cell/alive_cell'
require_relative '../../src/classes/cell/dead_cell'
require_relative './inheritance_classes/abstract_board_generation_test'

# Class to test Board class cells status checking.
class CellsStatusCheckingTest < TestAbstractBoardGeneration
  def test_set_alive_cell_status
    # Test when the cell is alive and has 1 or less neighbors.
    (-100..1).each do |number|
      assert_kind_of DeadCell, @board.send(:set_cell_status, AliveCell.new, number)
    end

    # Test when the cell is alive and has 2 or 3 neighbors.
    (2..3).each do |number|
      assert_kind_of AliveCell, @board.send(:set_cell_status, AliveCell.new, number)
    end

    # Test when the cell is alive and has 4 or more neighbors.
    (4..100).each do |number|
      assert_kind_of DeadCell, @board.send(:set_cell_status, AliveCell.new, number)
    end
  end

  def test_set_dead_cell_status
    # Test when the cell is dead and has 2 or less neighbors.
    (-100..2).each do |number|
      assert_kind_of DeadCell, @board.send(:set_cell_status, DeadCell.new, number)
    end

    # Test when the cell is dead and has 3 neighbors.
    assert_kind_of AliveCell, @board.send(:set_cell_status, DeadCell.new, 3)

    # Test when the cell is dead and has 4 or more neighbors.
    (4..100).each do |number|
      assert_kind_of DeadCell, @board.send(:set_cell_status, DeadCell.new, number)
    end
  end
end
