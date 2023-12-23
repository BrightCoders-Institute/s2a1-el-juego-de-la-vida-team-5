# frozen_string_literal: true

require 'minitest/autorun'

# Class to define methods for Board
# class patterns generation testing.
class TestAbstractBoardGeneration < Minitest::Test
  def setup
    @rows = 5
    @columns = 5
    @initial_cells_amount = 5
    @board = Board.new(@rows, @columns, @initial_cells_amount)
  end
end
