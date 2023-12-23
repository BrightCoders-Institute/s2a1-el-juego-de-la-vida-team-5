# frozen_string_literal: true

require_relative '../../../src/classes/cell/alive_cell'
require_relative '../../../src/classes/cell/dead_cell'

# Module to save Life of Game square testing patterns.
module SquarePatternsModule
  SQUARE_BOARD = [[DeadCell.new, DeadCell.new, DeadCell.new],
                  [DeadCell.new, AliveCell.new, AliveCell.new],
                  [DeadCell.new, AliveCell.new, AliveCell.new]].freeze

  SQUARE_PATTERNS = [[[DeadCell.new, DeadCell.new, DeadCell.new],
                      [DeadCell.new, AliveCell.new, AliveCell.new],
                      [DeadCell.new, AliveCell.new, AliveCell.new]],
                     [[DeadCell.new, DeadCell.new, DeadCell.new],
                      [DeadCell.new, AliveCell.new, AliveCell.new],
                      [DeadCell.new, AliveCell.new, AliveCell.new]],
                     [[DeadCell.new, DeadCell.new, DeadCell.new],
                      [DeadCell.new, AliveCell.new, AliveCell.new],
                      [DeadCell.new, AliveCell.new, AliveCell.new]]].freeze
end
