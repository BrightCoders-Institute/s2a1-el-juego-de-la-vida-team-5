# frozen_string_literal: true

require_relative './cell'
require_relative './alive_cell'

# Class to define a Game of Life dead cell.
class DeadCell < Cell
  VALUE = 0
  CELL_CHARACTER = '.'

  def check_cell_status_update(number_neighbors)
    number_neighbors == 3 ? AliveCell.new : DeadCell.new
  end
end
