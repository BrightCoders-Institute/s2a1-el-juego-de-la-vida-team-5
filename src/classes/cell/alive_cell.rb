# frozen_string_literal: true

require_relative './cell'
require_relative './dead_cell'

# Class to define a Game of Life alive cell.
class AliveCell < Cell
  VALUE = 1
  CELL_CHARACTER = '+'

  def check_cell_status_update(number_neighbors)
    number_neighbors.between?(2, 3) ? AliveCell.new : DeadCell.new
  end
end
